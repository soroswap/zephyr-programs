const swaggerPaths = {
    "paths": {
        "/api/events?network=mainnet": {
            "get": {
                "tags": [
                    "MAINNET"
                ],
                "summary": "Retrieve Mercury Events",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api/events?network=testnet": {
            "get": {
                "tags": [
                    "TESTNET"
                ],
                "summary": "Retrieve Mercury Events",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api?network=mainnet": {
            "get": {
                "tags": [
                    "MAINNET"
                ],
                "summary": "Retrieves XLM Price",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api?network=testnet": {
            "get": {
                "tags": [
                    "TESTNET"
                ],
                "summary": "Retrieves XLM Price",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api/pairs?protocol=soroswap&network=mainnet": {
            "get": {
                "tags": [
                    "MAINNET"
                ],
                "summary": "Retrieves soroswap pairs",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api/pairs?protocol=phoenix&network=mainnet": {
            "get": {
                "tags": [
                    "MAINNET"
                ],
                "summary": "Retrieves phoenix pairs",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api/pairs?protocol=aqua&network=mainnet": {
            "get": {
                "tags": [
                    "MAINNET"
                ],
                "summary": "Retrieves aqua pairs",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api/pairs?protocol=soroswap&network=testnet": {
            "get": {
                "tags": [
                    "TESTNET"
                ],
                "summary": "Retrieves soroswap pairs",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api/pairs?protocol=phoenix&network=testnet": {
            "get": {
                "tags": [
                    "TESTNET"
                ],
                "summary": "Retrieves phoenix pairs",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api/pairs?protocol=aqua&network=testnet": {
            "get": {
                "tags": [
                    "TESTNET"
                ],
                "summary": "Retrieves aqua pairs",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api/tokens?network=mainnet": {
            "get": {
                "tags": [
                    "MAINNET"
                ],
                "summary": "Retrieves tokens",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        },
        "/api/tokens?network=testnet": {
            "get": {
                "tags": [
                    "TESTNET"
                ],
                "summary": "Retrieves tokens",
                "responses": {
                    "200": {
                        "description": "Successful response"
                    }
                }
            }
        }
    }
}

export default swaggerPaths