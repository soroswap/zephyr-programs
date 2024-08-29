FROM node:latest

WORKDIR /workspace

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y \
  && . /root/.cargo/env

# Add the Rust toolchain to the PATH for subsequent commands
ENV PATH="/root/.cargo/bin:$PATH"
RUN cargo install mercury-cli

RUN rustup target add wasm32-unknown-unknown