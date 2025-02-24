import { config } from 'dotenv';
import { invokeCustomContract, createToolkit } from 'soroban-toolkit';
import { Keypair, scValToNative, xdr } from '@stellar/stellar-sdk';
import * as fs from 'fs';
import * as path from 'path';

// Load environment variables at the beginning of the script
config();

// Retry function with exponential delay
async function retry<T>(
    fn: () => Promise<T>,
    retries: number = 3,
    delay: number = 2000,
    backoff: number = 2
): Promise<T> {
    try {
        return await fn();
    } catch (error) {
        if (retries === 0) throw error;
        console.log(`⚠️ Retrying in ${delay}ms... (${retries} attempts remaining)`);
        await new Promise(resolve => setTimeout(resolve, delay));
        return retry(fn, retries - 1, delay * backoff, backoff);
    }
}

const FACTORY_CONTRACT = 'CA4HEQTL2WPEUYKYKCDOHCDNIV4QHNJ7EL4J4NQ6VADP7SYHVRYZ7AW2';

// Add this at the top level of the file
const mainnet = {
    network: "mainnet",
    friendbotUrl: "",
    horizonRpcUrl: process.env.MAINNET_RPC_URL as string,
    sorobanRpcUrl: process.env.MAINNET_RPC_URL as string,
    networkPassphrase: "Public Global Stellar Network ; September 2015"
}    

const sorobanToolkit = createToolkit({
    adminSecret: process.env.TEST_SECRET_KEY as string,
    contractPaths: {},
    addressBookPath: "",
    customNetworks: [mainnet],
    verbose: "full"
});

// Create a single instance of networkToolkit
const networkToolkit = sorobanToolkit.getNetworkToolkit("mainnet");

async function getAllPairsLength(): Promise<number> {
    try {
        const result = await invokeCustomContract(
            networkToolkit,
            FACTORY_CONTRACT,
            'all_pairs_length',
            [],
            true,
            Keypair.fromSecret(process.env.TEST_SECRET_KEY as string)
        );
        return Number(scValToNative(result.result.retval));
    } catch (error) {
        console.error('❌ Error getting total number of pairs:', error);
        throw error;
    }
}

async function getPairAddress(index: number): Promise<string> {
    try {
        const result = await invokeCustomContract(
            networkToolkit,
            FACTORY_CONTRACT,
            'all_pairs',
            [xdr.ScVal.scvU32(index)],
            true,
            Keypair.fromSecret(process.env.TEST_SECRET_KEY as string)
        );
        return scValToNative(result.result.retval);
    } catch (error) {
        console.error(`❌ Error getting pair address ${index}:`, error);
        throw error;
    }
}

async function getToken(pairAddress: string, method: 'token_0' | 'token_1'): Promise<string> {
    try {
        const result = await invokeCustomContract(
            networkToolkit,
            pairAddress,
            method,
            [],
            true,
            Keypair.fromSecret(process.env.TEST_SECRET_KEY as string)
        );
        return scValToNative(result.result.retval);
    } catch (error) {
        console.error(`❌ Error getting token (${method}) for pair ${pairAddress}:`, error);
        throw error;
    }
}

async function getPairReserves(pairAddress: string): Promise<[bigint, bigint]> {
    try {
        const result = await invokeCustomContract(
            networkToolkit,
            pairAddress,
            'get_reserves',
            [],
            true,
            Keypair.fromSecret(process.env.TEST_SECRET_KEY as string)
        );
        const [reserve0, reserve1] = scValToNative(result.result.retval);
        return [BigInt(reserve0), BigInt(reserve1)];
    } catch (error) {
        console.error(`❌ Error getting reserves for ${pairAddress}:`, error);
        return [BigInt(0), BigInt(0)];
    }
}

async function generatePairTokenReservesList(): Promise<void> {
    const pairTokenReserves: {
        address: string;
        token_a: string;
        token_b: string;
        reserve_a: string;
        reserve_b: string;
    }[] = [];
    const failedPairs: string[] = [];
    const totalPairs = await getAllPairsLength();
    console.log(`📊 Total pairs found: ${totalPairs}`);
    try {
        console.log("🚀 Getting pairs information...");
        
        for (let i = 0; i < totalPairs; i++) {
            try {
                console.log(`📊 Processing pair ${i + 1}/${totalPairs}`);
                
                const pairAddress = await retry(() => getPairAddress(i));
                const token_a = await retry(() => getToken(pairAddress, 'token_0'));
                const token_b = await retry(() => getToken(pairAddress, 'token_1'));
                const [reserve_a, reserve_b] = await retry(() => getPairReserves(pairAddress));
                
                pairTokenReserves.push({
                    address: pairAddress,
                    token_a,
                    token_b,
                    reserve_a: reserve_a.toString(),
                    reserve_b: reserve_b.toString()
                });
                
                console.log(`✅ Information obtained for pair: ${pairAddress}`);
                await new Promise(resolve => setTimeout(resolve, 1000));
                
            } catch (error) {
                console.error(`❌ Error processing pair ${i}:`, error);
                failedPairs.push(`Pair index ${i}`);
                continue;
            }
        }

        // Escribir directamente el array como JSON
        const filePath = path.join(__dirname, '../ssw_pairs_recreate.json');
        fs.writeFileSync(filePath, JSON.stringify(pairTokenReserves, null, 2));
        console.log(`✅ ssw_pairs_recreate.json file generated successfully`);

    } catch (error) {
        console.error("❌ General error:", error);
        throw error;
    } finally {
        console.log("\n📊 Execution summary:");
        console.log(`✅ Pairs processed successfully: ${pairTokenReserves.length}`);
        if (failedPairs.length > 0) {
            console.log(`❌ Pairs with errors (${failedPairs.length}):`);
            failedPairs.forEach(pair => console.log(`   - ${pair}`));
        }
    }
}

// Check environment variables
if (!process.env.MAINNET_RPC_URL || !process.env.TEST_SECRET_KEY) {
    console.error("❌ Error: MAINNET_RPC_URL and TEST_SECRET_KEY environment variables are required");
    process.exit(1);
}

generatePairTokenReservesList()
    .then(() => {
        console.log("✨ Pairs, tokens and reserves list generated successfully");
        process.exit(0);
    })
    .catch((error) => {
        console.error("❌ Error generating list:", error);
        process.exit(1);
    });