# zephyr-indexer

`git clone https://github.com/soroswap/zephyr-indexer.git`

`cd zephyr-indexer`

`docker build -t hello-zephyr .`

`docker run -it hello-zephyr /bin/bash`

`export MERCURY_JWT=<YOUR_MERCURY_JWT_TOKEN>`

`mercury-cli --jwt $MERCURY_JWT --local false --mainnet false deploy`
