# Introduction
A simple PostgreSQL cluster for use by the "Database Design, an Introduction" course.

# What this is NOT
* This is not a [Docker Desktop](https://www.docker.com/products/docker-desktop/) tutorial so head on over to [Docker Desktop](https://www.docker.com/products/docker-desktop/)!
* This is not a [Docker cli](https://docs.docker.com/engine/reference/commandline/cli/) tutorial so head on over to [Docker cli](https://docs.docker.com/engine/reference/commandline/cli/)!

 I could create tutorials if really needed. Although the detailed documentation does a good job at giving you a solid foundation to build from.
* This is not a [pgTAP](https://pgtap.org/) tutorial but feel free to head on over to [pgTAP](https://pgtap.org/). I encourage you to do so!
* This is not a [pg_prove](https://github.com/theory/tap-parser-sourcehandler-pgtap) tutorial but feel free to head on over to [pg_prove](https://github.com/theory/tap-parser-sourcehandler-pgtap). I encourage you to do so!
* This is not a [sqitch](https://sqitch.org/) tutorial but feel free to head on over to [sqitch](https://sqitch.org/). I encourage you to do so!

# Initial Environment Setup
* Pull the [dvdrental database image](https://hub.docker.com/r/sirsplat/dvdrental):
    ```
    docker run -d --name dvdrental -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword sirsplat/dvdrental:latest
    ```
* Create the DVDRental application database:
    ```
    docker exec dvdrental bash /code/initdb.sh
    ```
* Clone [this repo](https://github.com/SirSplat/dvdrental):
    ```
    git clone https://github.com/SirSplat/dvdrental.git
    ```
    This contains all the DDL, and DML you'll require, [sqitch migration scripts](https://github.com/SirSplat/dvdrental/tree/main/migrations) and [pg_prove tests](https://github.com/SirSplat/dvdrental/tree/main/pgprove).

# License
[MIT License](./LICENSE)