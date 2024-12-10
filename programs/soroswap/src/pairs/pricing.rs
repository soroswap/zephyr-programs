use zephyr_sdk::{EnvClient};
use crate::{PairsTable};

// Decimal precision used throughout the pricing calculations
// We use 7 decimal places (10^7) to maintain high precision while avoiding overflow
const DECIMALS: i128 = 10_000_000; // 10^7

// Addresses of XLM-Stablecoin pairs used as price oracles
// These pairs were obtained from dune analytics and are used to calculate XLM price
const USDC_XLM_PAIR: &str = "CAM7DY53G63XA4AJRS24Z6VFYAFSSF76C3RZ45BE5YU3FQS5255OOABP";
const USDX_XLM_PAIR: &str = "CDJDRGUCHANJDXALZVJ5IZVB76HX4MWCON5SHF4DE5HB64CBBR7W2ZCD";

/// Calculates the current price of XLM in USD using two stablecoin pairs as oracles
/// Uses a weighted average based on liquidity if both pairs exist, otherwise falls back to single pair
/// Returns the price with DECIMALS precision (e.g., 1.5 USD = 1.5 * 10^7)
pub fn get_xlm_price_in_usd(env: &EnvClient) -> i128 {
    // Read pairs table once to avoid multiple reads
    let pairs = env.read::<PairsTable>();
    
    // Find both stablecoin pairs in the pairs table
    let usdc_pair = pairs.iter()
        .find(|p| p.address == env.to_scval(USDC_XLM_PAIR));
        
    let usdx_pair = pairs.iter()
        .find(|p| p.address == env.to_scval(USDX_XLM_PAIR));

    // If both pairs exist, calculate weighted average price
    if let (Some(usdc_pair), Some(usdx_pair)) = (usdc_pair, usdx_pair) {
        // Extract reserves from both pairs
        let reserve_a_usdc: i128 = env.from_scval(&usdc_pair.reserve_a);
        let reserve_b_usdc: i128 = env.from_scval(&usdc_pair.reserve_b);
        let reserve_a_usdx: i128 = env.from_scval(&usdx_pair.reserve_a);
        let reserve_b_usdx: i128 = env.from_scval(&usdx_pair.reserve_b);

        // Calculate total XLM liquidity across both pairs
        let total_liquidity_xlm = reserve_b_usdc + reserve_b_usdx;
        
        // Calculate individual prices, multiplied by DECIMALS for precision
        let usdc_price = (reserve_a_usdc * DECIMALS) / reserve_b_usdc;
        let usdx_price = (reserve_a_usdx * DECIMALS) / reserve_b_usdx;
        
        // Calculate liquidity weights for each pair
        let usdc_weight = (reserve_b_usdc * DECIMALS) / total_liquidity_xlm;
        let usdx_weight = (reserve_b_usdx * DECIMALS) / total_liquidity_xlm;
        
        // Return weighted average price, adjusting for DECIMALS
        return (usdc_price * usdc_weight + usdx_price * usdx_weight) / DECIMALS;
    } 
    // Fallback to USDC pair if it's the only one available
    else if let Some(usdc_pair) = usdc_pair {
        let reserve_a: i128 = env.from_scval(&usdc_pair.reserve_a);
        let reserve_b: i128 = env.from_scval(&usdc_pair.reserve_b);
        return (reserve_a * DECIMALS) / reserve_b;
    }
    
    0
}

// Whitelist of trusted tokens for volume tracking
// These addresses are from the token list and represent verified tokens
const WHITELIST: &[&str] = &[
    "CAAV3AE3VKD2P4TY7LWTQMMJHIJ4WOCZ5ANCIJPC3NRSERKVXNHBU2W7", // XRP by Muyu Network
    "CACFQEH2USDRGSBYFOVJMX4DMX7HMRYAYOV2IWR7XEX3DD3HYQEWPAAL", // Swiss Franc
    "CAH5D34KB7BQ2XXYEUYTBEXK7UZATBP2KHVGSHODHKQXIRTE7IOKI37Q", // Ethereum
    "CAIRIR3ITE2KNBWHRIAOBBZ2AHIKU5BVTKFTW5IYCOAENR4L5T2THGN6", // Bitcoin
    "CAPIOPSODD5QP4SJNIS4ASUWML4LH7ZEKTAPBJYZSMKXCATEKDZFKLHK", // NUNA Project
    "CASVAKL4HL2UYUOHHRX6GPWEVDJJLZGD32RCKSD2ENJ7KF2BOGLFNN7G", // Bitcoin Cash
    "CATHRLMZW3JUIYSXYE4YAI3SBBBQGXYAP674RINGUBQLNFTCZHMI5XZJ", // Mobius
    "CAUIKL3IYGMERDRUN6YSCLWVAKIFG5Q4YJHUKM4S4NJZQIA3BAS6OJPK", // AQUA Token
    "CAWSVMCGBT4YEDH4PK64TZ3IRTXDHZJ6PDSSUARFLKRG2H3MUBLTVQ6C", // Stellar NFT
    "CB226ZOEYXTBPD3QEGABTJYSKZVBP2PASEISLG3SBMTN5CE4QZUVZ3CE", // Glo Dollar
    "CB2XLDU74PIXO5DENULX53IIC3DMKGN2UM5IBGMSSI634IAQJ7O3Z3UQ", // Realio Token
    "CB2XMFB6BDIHFOSFB5IXHDOYV3SI3IXMNIZLPDZHC7ENDCXSBEBZAO2Y", // yBTC by Ultra Capital
    "CBAANNZVSOH6I42ZVVFTVB2JNVSHVBYUDWGGJHB4BLCXARYTNN3ODU3F", // Kenya Shilling
    "CBBJTE34KZHJACB2A6OXCRTDDLX4LI7GKYYD6XYJSGMX46BLNAG752HS", // IXINIUM
    "CBDRPADR3KIBJNUBNRTTO4P7NO5RVPMYKRJB5YCZUZ6B66RKYK324UJY", // Chilean PESO
    "CBF4E5GSTVSITE5Q2ENOTEUQJPBZAU3SBDVLQMSQ7GLBRTSYGUAT722K", // Brazilian Real
    "CBHBD77PWZ3AXPQVYVDBHDKEMVNOR26UZUZHWCB6QC7J5SETQPRUQAS4", // SSLX Cassator
    "CBHIQPUXLFLC5O44ZJVUTCL5LMZFLVGU5DEIGSYKBSAPFMOGTKOQEPFM", // Bitcoin Lightning
    "CBLLEW7HD2RWATVSMLAGWM4G3WCHSHDJ25ALP4DI6LULV5TU35N2CIZA", // Reflector xRF
    "CBRP2VD3CZLEQIQZ4JMBXGA5AC2U6JE26YU5CCIOICIZCVWPGBO2QRUB", // YieldBlox
    "CBVDRT5474OBUEXF5MJB3UGQ5CG7CKGCAH5M4RV5NBCDJUBZ5OXHJLOU", // EURo Coin
    "CBVJZDNMOPEEPED3OBY4VLQPQKU4IOCKWACDKXPBO4E6TQI432W66BE5", // Coin Mex
    "CBXE6V454EUYWVQCI4TCSOG4CSNPQ2BLYOTKAKXYFHO3KNVX4CXYCY2T", // Lumenswap asset
    "CBYFV4W2LTMXYZ3XWFX5BK2BY255DU2DSXNAE4FJ5A5VYUWGIBJDOIGG", // NGNC Coin
    "CBZCBYTP3TFCT7PCDRPJDQK7UY2R3QA4H6MF2P6XDS5CZNXLPF6S6OPB", // Zioncoin
    "CBZVSNVB55ANF24QVJL2K5QCLOAB6XITGTGXYEAF6NPTXYKEJUYQOHFC", // yXLM by Ultra Capital
    "CCD6H4LBTHAPY3NGEE6TLLRUSPJGX4K5XI2J6E4MUNDB5TNXEKC23H5B", // Peso Digital
    "CCEBHXWHT2UX6QQ7WZOV6KRGUILICPRFOZD2CEAHZ5AYX7EFW3RG6I2F", // US Dollar
    "CCG27OZ5AV4WUXS6XTECWAXEY5UOMEFI2CWFA3LHZGBTLYZWTJF3MJYQ", // AFREUM
    "CCJVS6IVXAAXWCMFVK6QLWHZHR4RTVRSEZRQ53GOAEDN3VY2BLPVY72J", // Scopuly
    "CCKCKCPHYVXQD4NECBFJTFSCU2AMSJGCNG4O6K4JVRE2BLPR7WNDBQIQ", // Stronghold SHx
    "CCRPYMVKZLWGZHEDZ23FOE22E3T3HOCNP5Y2EFZFVRUVIXU5NJ7UNGV2", // ARST Coin
    "CCW67TSZV3SSS2HXMBQ5JFGCKJNXKZM7UQUWUZPUTHXSTZLEO7SJMI75", // USD Coin
    "CCWVP5HVC2TSRNLONGRVS7UK47ORIPURNAGFQ3VR6DP2B77E67QV6P7B", // Litecoin
    "CCXY3CNHSU2DPUOZFKNNH67IVRMBRCATX4SABDSLBY5LAJI66LRLHTJQ", // Threefold Token
    "CD25MNVTZDL4Y3XBCPCJXGXATV5WUHHOWMYFF4YBEGU5FCPGMYTVG5JY", // Blend
    "CD2GNQFE3GRUY5LRE5WT26OQIUBUQ5YKRVDRQ3FWCW7A7NZAPPFIHFAY", // Tanzania Shilling
    "CDCKFBZYF2AQCSM3JOF2ZM27O3Y6AJAI4OTCQKAFNZ3FHBYUTFOKICIY", // XTAR Coin
    "CDCSVQEMYBNK7URICI77CENLP23OIM4AAXUIJ32Z6V3ZT3QXCP2HJXD7", // Naira Token
    "CDDQRIGZRK6Z6ILV4P276HL7D3P63GFW6HBA4N4YXDMFHZ2M4VZGVYRW", // FIDR Coin
    "CDGLDM5N34GBRCALDBKVVV4ACVS2TWZLUSMILM32FPIMPHLUUIIRTCNF", // FRED Energy
    "CDIKURWHYS4FFTR5KOQK6MBFZA2K3E26WGBQI6PXBYWZ4XIOPJHDFJKP", // Decentralized USD Coin
    "CDJXADCJHQJDAQQMUJU4TTRXS4ZAEFIA5F5RG4HP7M42CKQIZCXTCDR2", // PaybandCoin
    "CDOFW7HNKLUZRLFZST4EW7V3AV4JI5IHMT6BPXXSY2IEFZ4NE5TWU2P4", // yUSDC
    "CDOIEBW5LN7T7PSFY6ADLPIDF52PFRX57WIYWJ637PCZ7ZFDDN5T6NCH", // SDEX Explorer Token
    "CDTHHEDO2YPVXEHZZA3MW5IYECGEM3MF7THR3H7TLDFD6PYPKMAMF6GJ", // iFIDR
    "CDTKPWPLOURQA2SGTKTUQOWRCBZEORB4BWBOMJ3D3ZTQQSGE5F6JBQLV", // EURMTL
    "CDYBK2X5ZEQ7ZNDN7IPWWMOQ6SWEJW4A4UE2PNDFDVCYNAXB64O4FNXX", // Indonesian IDRT
    "CDYEOOVL6WV4JRY45CXQKOBJFFAPOM5KNQCCDNM333L6RM2L4RO3LKYG", // yETH By Ultra Capital
    "CDZNTXPXR2I7VFDBYBADK2DE2SSGQ3DTXT5MJDCTYUMNVFK3CWG5NVC7", // Ethereum
    ];

// Minimum thresholds for considering pairs in calculations
// Helps filter out pairs with insufficient liquidity
const MINIMUM_USD_THRESHOLD_NEW_PAIRS: i128 = 1_000_0000000; // $1,000 with 7 decimals
const MINIMUM_LIQUIDITY_THRESHOLD_XLM: i128 = 2_0000000; // 2 XLM with 7 decimals

/// Finds the XLM price of a given token using whitelisted pairs
/// Returns the price with DECIMALS precision, or 0 if no valid pair is found
pub fn find_xlm_per_token(env: &EnvClient, token_address: &str) -> i128 {
    // If the token is XLM itself, return 1 (with DECIMALS precision)
    if token_address == "XLM_ADDRESS" {
        return DECIMALS;
    }

    // Search through whitelisted tokens for a valid pair
    for whitelist_token in WHITELIST {
        let pairs_table = env.read::<PairsTable>();
        // Look for a pair containing both the target token and a whitelisted token
        let pair = pairs_table
            .iter()
            .find(|p| {
                let token_a: String = env.from_scval(&p.token_a);
                let token_b: String = env.from_scval(&p.token_b);
                (token_a == token_address && token_b == *whitelist_token) ||
                (token_b == token_address && token_a == *whitelist_token)
            });

        if let Some(pair) = pair {
            let reserve_a: i128 = env.from_scval(&pair.reserve_a);
            let reserve_b: i128 = env.from_scval(&pair.reserve_b);
            let token_a: String = env.from_scval(&pair.token_a);
            
            // Only use pairs with sufficient liquidity
            if reserve_b > MINIMUM_LIQUIDITY_THRESHOLD_XLM {
                // Calculate price based on token position in the pair
                if token_a == token_address {
                    return (reserve_a * DECIMALS) / reserve_b;
                } else {
                    return (reserve_b * DECIMALS) / reserve_a;
                }
            }
        }
    }
    
    0
}

/// Calculates the USD value of trading volume for a pair
/// Only counts volume for whitelisted tokens to ensure accuracy
pub fn get_tracked_volume_usd(
    env: &EnvClient,
    token_amount0: i128,
    token0_address: &str,
    token_amount1: i128, 
    token1_address: &str,
    _pair_address: &str
) -> i128 {
    let xlm_price = get_xlm_price_in_usd(env);
    let price0 = find_xlm_per_token(env, token0_address) * xlm_price;
    let price1 = find_xlm_per_token(env, token1_address) * xlm_price;

    // If both tokens are whitelisted, average their volumes
    if WHITELIST.contains(&token0_address) && WHITELIST.contains(&token1_address) {
        return (token_amount0 * price0 + token_amount1 * price1) / 2;
    }

    // If only one token is whitelisted, use its volume
    if WHITELIST.contains(&token0_address) {
        return token_amount0 * price0;
    }

    if WHITELIST.contains(&token1_address) {
        return token_amount1 * price1;
    }

    0
}

/// Calculates the total USD value of liquidity in a pair
/// Similar to volume tracking, but doubles single-sided liquidity for consistency
pub fn get_tracked_liquidity_usd(
    env: &EnvClient,
    token_amount0: i128,
    token0_address: &str,
    token_amount1: i128,
    token1_address: &str,
) -> i128 {
    let xlm_price = get_xlm_price_in_usd(env);
    let price0 = find_xlm_per_token(env, token0_address) * xlm_price;
    let price1 = find_xlm_per_token(env, token1_address) * xlm_price;

    // If both tokens are whitelisted, sum their values
    if WHITELIST.contains(&token0_address) && WHITELIST.contains(&token1_address) {
        return token_amount0 * price0 + token_amount1 * price1;
    }

    // If only one token is whitelisted, double its value to represent full liquidity
    if WHITELIST.contains(&token0_address) {
        return token_amount0 * price0 * 2;
    }

    if WHITELIST.contains(&token1_address) {
        return token_amount1 * price1 * 2;
    }

    0
}