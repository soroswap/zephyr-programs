# Zephyr Programs API

## Description

This API is built with **Express** and **TypeScript** to provide information about pairs, events, and tokens from Mercury Zephyr. 

## Features

- **Endpoints:**
  - `GET /api/pairs`: Retrieve a list of pairs.
  - `GET /api/events`: Retrieve a list of events.
  - `GET /api/tokens`: Retrieve a list of tokens.
- **Swagger Documentation** available at `/api-docs`.

## Technologies

- **Node.js** & **Express**
- **TypeScript**
- **Swagger**
- **Jest** & **Supertest** for testing

## Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/soroswap/zephyr-programs.git
    cd zephyr-programs/server
    ```

2. **Install dependencies**:
    ```bash
    yarn install
    ```

## Configuration

1. **Create a `.env` file** in the `server` directory:
    ```bash
    cp .env.example .env
    ```

2. **Edit `.env`** with necessary variables:
    ```env
    # Mercury MAINNET
    MERCURY_EMAIL_MAINNET=
    MERCURY_PASSWORD_MAINNET=
    MERCURY_BACKEND_ENDPOINT_MAINNET=https://mainnet.mercurydata.app
    MERCURY_GRAPHQL_ENDPOINT_MAINNET=https://mainnet.mercurydata.app:2083

    # Mercury TESTNET
    MERCURY_EMAIL_TESTNET=
    MERCURY_PASSWORD_TESTNET=
    MERCURY_BACKEND_ENDPOINT_TESTNET=https://api.mercurydata.app:8443
    MERCURY_GRAPHQL_ENDPOINT_TESTNET=https://api.mercurydata.app:2083

    # Environment
    ENVIRONMENT=prod
    ```

## Usage

### Run Locally

Start the development server:
```bash
yarn dev
