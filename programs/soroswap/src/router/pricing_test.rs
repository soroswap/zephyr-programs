#[cfg(test)]
mod test {
    use zephyr_sdk::testutils::TestHost;
    use zephyr_sdk::soroban_sdk::String as SorobanString;
    use super::super::pricing::{get_xlm_price_in_usd, find_xlm_per_token, get_tracked_volume_usd, get_tracked_liquidity_usd};

    // Direcciones de  los tokens que vamos a probar
    const EURO_COIN: &str = "CBVDRT5474OBUEXF5MJB3UGQ5CG7CKGCAH5M4RV5NBCDJUBZ5OXHJLOU";
    const BTC_LIGHTNING: &str = "CBHIQPUXLFLC5O44ZJVUTCL5LMZFLVGU5DEIGSYKBSAPFMOGTKOQEPFM";
    const ETHEREUM: &str = "CAH5D34KB7BQ2XXYEUYTBEXK7UZATBP2KHVGSHODHKQXIRTE7IOKI37Q";
    const XLM_ADDRESS: &str = "XLM_ADDRESS";

    // Función helper para configurar los pares en el ambiente de prueba
    fn setup_test_pairs(env: &TestHost) {
        // Configuramos los pares XLM-USDC y XLM-USDX para el precio de XLM
        let pairs_table = env.create_table("pairs");
        
        // Mock del par XLM-USDC con reservas
        pairs_table.insert(vec![
            ("address", env.to_scval("CAM7DY53G63XA4AJRS24Z6VFYAFSSF76C3RZ45BE5YU3FQS5255OOABP")),
            ("reserve_a", env.to_scval(1_000_000_000i128)), // 1M USDC
            ("reserve_b", env.to_scval(5_000_000_000i128))  // 5M XLM
        ]);

        // Mock de pares para los tokens de prueba
        // EUR/XLM
        pairs_table.insert(vec![
            ("token_a", env.to_scval(EURO_COIN)),
            ("token_b", env.to_scval(XLM_ADDRESS)),
            ("reserve_a", env.to_scval(1_000_000_000i128)),
            ("reserve_b", env.to_scval(4_000_000_000i128))
        ]);

        // BTC-L/XLM
        pairs_table.insert(vec![
            ("token_a", env.to_scval(BTC_LIGHTNING)),
            ("token_b", env.to_scval(XLM_ADDRESS)),
            ("reserve_a", env.to_scval(100_000_000i128)),
            ("reserve_b", env.to_scval(20_000_000_000i128))
        ]);

        // ETH/XLM
        pairs_table.insert(vec![
            ("token_a", env.to_scval(ETHEREUM)),
            ("token_b", env.to_scval(XLM_ADDRESS)),
            ("reserve_a", env.to_scval(500_000_000i128)),
            ("reserve_b", env.to_scval(10_000_000_000i128))
        ]);
    }

    #[test]
    fn test_xlm_price() {
        let env = TestHost::default();
        setup_test_pairs(&env);

        let xlm_price = get_xlm_price_in_usd(&env);
        assert!(xlm_price > 0, "XLM price should be greater than 0");
    }

    #[test]
    fn test_token_prices() {
        let env = TestHost::default();
        setup_test_pairs(&env);

        // Probar precio de XLM (debería ser 1 XLM)
        let xlm_price = find_xlm_per_token(&env, XLM_ADDRESS);
        assert_eq!(xlm_price, 10_000_000, "XLM/XLM price should be 1.0");

        // Probar precio de Euro Coin
        let euro_price = find_xlm_per_token(&env, EURO_COIN);
        assert!(euro_price > 0, "Euro price should be greater than 0");

        // Probar precio de BTC Lightning
        let btc_price = find_xlm_per_token(&env, BTC_LIGHTNING);
        assert!(btc_price > 0, "BTC-L price should be greater than 0");

        // Probar precio de Ethereum
        let eth_price = find_xlm_per_token(&env, ETHEREUM);
        assert!(eth_price > 0, "ETH price should be greater than 0");
    }

    #[test]
    fn test_tracked_volume() {
        let env = TestHost::default();
        setup_test_pairs(&env);

        // Probar volumen entre EUR/XLM
        let volume_eur_xlm = get_tracked_volume_usd(
            &env,
            1_000_000_000,  // 1M EUR
            EURO_COIN,
            4_000_000_000,  // 4M XLM
            XLM_ADDRESS,
            "pair_address"
        );
        assert!(volume_eur_xlm > 0, "EUR/XLM volume should be tracked");

        // Probar volumen entre tokens no listados
        let volume_unlisted = get_tracked_volume_usd(
            &env,
            1_000_000_000,
            "UNLISTED_TOKEN_1",
            1_000_000_000,
            "UNLISTED_TOKEN_2",
            "pair_address"
        );
        assert_eq!(volume_unlisted, 0, "Unlisted tokens should have 0 volume");
    }

    #[test]
    fn test_tracked_liquidity() {
        let env = TestHost::default();
        setup_test_pairs(&env);

        // Probar liquidez de ETH/XLM
        let liquidity_eth_xlm = get_tracked_liquidity_usd(
            &env,
            500_000_000,   // 0.5M ETH
            ETHEREUM,
            10_000_000_000, // 10M XLM
            XLM_ADDRESS
        );
        assert!(liquidity_eth_xlm > 0, "ETH/XLM liquidity should be tracked");

        // Probar liquidez con un solo token listado
        let liquidity_single = get_tracked_liquidity_usd(
            &env,
            1_000_000_000,
            BTC_LIGHTNING,
            1_000_000_000,
            "UNLISTED_TOKEN",
        );
        assert!(liquidity_single > 0, "Single listed token liquidity should be tracked");
    }
}
