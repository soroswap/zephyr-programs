FROM rust:latest

WORKDIR /usr/src/app

RUN cargo install mercury-cli

RUN rustup target add wasm32-unknown-unknown

COPY . .

