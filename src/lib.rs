use zephyr_sdk::{prelude::*, soroban_sdk::xdr::{ScString, ScVal}, EnvClient, DatabaseDerive};

#[derive(DatabaseDerive, Clone)]
#[with_name("test")]
struct TestTable {
    message: ScVal,
}

#[no_mangle]
pub extern "C" fn on_close() {
    let env = EnvClient::new();

    let message = {
        let message = format!("Hello Soroswap");
        ScVal::String(ScString(message.try_into().unwrap()))
    };

    let table = TestTable {
        message: message.clone(),
    };

    env.log().debug(
        "Writing to the database",
        Some(bincode::serialize(&message).unwrap()),
    );
    table.put(&env);
    env.log().debug("Successfully wrote to the database", None);
}