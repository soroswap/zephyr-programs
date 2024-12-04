## Description

This API is built with **Express** and **TypeScript** to provide information about pairs, events, and tokens from Mercury Zephyr.

## Features

- **Endpoints:**
  - `GET /api/pairs`: Retrieves a list of pairs.
  - `GET /api/events`: Retrieves a list of events.
  - `GET /api/tokens`: Retrieves a list of tokens.
- **Swagger Documentation** available at `/api-docs`.

## Technologies

- **Node.js** & **Express**
- **TypeScript**
- **Swagger**
- **Jest** & **Supertest** for testing

## Installation

1. **Clone the repository**:

    `git clone https://github.com/soroswap/zephyr-programs.git
    cd zephyr-programs/server`

2. **Install dependencies**:

    `yarn install`

## Configuration

1. **Create a `.env` file** in the `server` directory:

    `cp .env.example .env`

2. **Edit `.env`** with the necessary variables:

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
    ENVIRONMENT=dev
    ```

## Usage

### Run Locally

Start the development server:

`yarn dev`

## Configuration on Vercel

To deploy the API on Vercel, follow these steps:

### Create an Account on Vercel

Register at [vercel.com](https://vercel.com) if you don't have an account yet.

### Import the Project

From the Vercel dashboard, click on **"New Project"** and select your GitHub repository that contains the `zephyr-programs` project.

### Set Environment Variables

In **Environment Variables**, add the necessary variables. The same variables of configuration

If you are in development mode and using mock data, you can set `ENVIRONMENT=dev` and it's not necessary to configure the Mercury variables.

### `vercel.json` File

Ensure you have a `vercel.json` file at the root of your project (or in the `server` folder if that's the root in Vercel).

```
{
  "version": 2,
  "builds": [
    { "src": "server/src/index.ts", "use": "@vercel/node" }
  ],
  "routes": [
    { "src": "/(.*)", "dest": "server/src/index.ts" }
  ],
  "installCommand": "cd server && yarn install",
  "buildCommand": "cd server && yarn build"
}
```

### Deploy the Project

Click on **"Deploy"** and wait for the deployment to complete.

### Test the API on Vercel

Access the URL provided by Vercel.

Test the endpoints, for example:

- `https://your-project.vercel.app/api/events?protocol=soroswap&network=MAINNET`
- `https://your-project.vercel.app/api/pairs?protocol=soroswap&network=MAINNET`
- `https://your-project.vercel.app/api/tokens?protocol=soroswap&network=MAINNET`

Access the Swagger documentation at:

- `https://your-project.vercel.app/api-docs`

## Additional Notes

- **Swagger on Vercel**: The Swagger documentation is available at the endpoint `/api-docs` and is deployed along with the API on Vercel.
- **Custom Domain**: Although you are currently using the domain provided by Vercel, in the future you can configure a custom domain like `api.soroswap.finance`.

## Routes and Parameters

### Available Endpoints

#### Events

**GET /api/events**

- **Description**: Retrieves a list of events for a specific protocol.
- **Query Parameters**:
  - `protocol` (required): Protocol name (`soroswap`, `phoenix`, `aqua`).
  - `network` (required): Network name (`MAINNET`, `TESTNET`).
  - `type` (optional): Event type (`swap`, `add`, `remove`).
  - `address` (optional): Specific pool address.

#### Pairs

**GET /api/pairs**

- **Description**: Retrieves a list of pairs for a specific protocol.
- **Query Parameters**:
  - `protocol` (required): Protocol name (`soroswap`, `phoenix`, `aqua`).
  - `network` (required): Network name (`MAINNET`, `TESTNET`).
  - `address` (optional): Specific pair address.
  - `full` (optional): Indicates whether to include all unfiltered pairs (`true` or `false`).

#### Tokens

**GET /api/tokens**

- **Description**: Retrieves a list of tokens or a specific token for a protocol.
- **Query Parameters**:
  - `protocol` (required): Protocol name (`soroswap`, `phoenix`, `aqua`).
  - `network` (required): Network name (`MAINNET`, `TESTNET`).
  - `address` (optional): Specific token address.