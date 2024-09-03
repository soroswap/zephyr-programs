# zephyr-programs

1.- Clone this Repo
`git clone https://github.com/soroswap/zephyr-programs.git`

`cd zephyr-programs`

2.- Fill with 3 Mercury JWT Tokens.
Because we will be deploying 3 Zephyr programs, we will need 3 different JWT tokens.

`cp .env.example .env`

In `.env` fill your `JWT_0`, `JWT_1` and `JWT_2` values

3.- Run the Docker Container

`docker compose up -d`

4.- Enter to the Docker Terminal

`bash run.sh`

TODO: Complete readme and enviroment to work with multiple zephyr programs, create a JWT for each program, automate scripts 