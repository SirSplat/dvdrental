# Introduction
A simple PostgreSQL cluster for use by the "Database Design, an Introduction" course.

# What this is NOT
* This is not a [Docker Desktop](https://www.docker.com/products/docker-desktop/) tutorial so head on over to [Docker Desktop](https://www.docker.com/products/docker-desktop/)!
* This is not a [Docker cli](https://docs.docker.com/engine/reference/commandline/cli/) tutorial so head on over to [Docker cli](https://docs.docker.com/engine/reference/commandline/cli/)!

 I could create tutorials if really needed. Although the detailed documentation does a good job at giving you a solid foundation to build on.
* This is not a [pgTAP](https://pgtap.org/) tutorial but feel free to head on over to [pgTAP](https://pgtap.org/). I encourage you to do so!
* This is not a [pg_prove](https://github.com/theory/tap-parser-sourcehandler-pgtap) tutorial but feel free to head on over to [pg_prove](https://github.com/theory/tap-parser-sourcehandler-pgtap). I encourage you to do so!
* This is not a [sqitch](https://sqitch.org/) tutorial but feel free to head on over to [sqitch](https://sqitch.org/). I encourage you to do so!

# Initial Environment Setup
* Pull the [dvdrental database image](https://hub.docker.com/r/sirsplat/dvdrental):

        docker run -d --name dvdrental -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword sirsplat/dvdrental:latest

* Create the DVDRental application database:

        docker exec dvdrental bash /code/initdb.sh

* Clone [this repo](https://github.com/SirSplat/dvdrental):

        git clone https://github.com/SirSplat/dvdrental.git

This contains all the DDL, and DML you'll require, [sqitch migration scripts](https://github.com/SirSplat/dvdrental/tree/main/migrations) and [pg_prove tests](https://github.com/SirSplat/dvdrental/tree/main/pgprove).
* Pull the [pg_prove image](https://hub.docker.com/r/itheory/pg_prove)
    and follow "How to use this image".
* Pull the [sqitch image](https://hub.docker.com/r/sqitch/sqitch)
    and follow "How to use this image".
* To help you out a little, you'll need to do this:
    * Open your terminal.
    * Change to your home directory:

            cd ~

    * Create a .sqitch directory:

            mkdir .sqitch

    * Create a sqitch.conf in the .sqitch directory you just created:

            cat <<EOF > .sqitch/sqitch.conf
            [user]
    	        name = Your Name
    	        email = Your Email Address
            EOF

    * As you're here (in your home directory), you might as well create a .pgpass file (not in the .sqitch directory!)
        if you're on a Windows machine, you're on your own!

            cat <<EOF > ~/.pgpass
            *:*:*:*:mysecretpassword
            EOF

            chmod 0600 ~/.pgpass

        This is breaking every rule about placing secrets in plain text in a git repo. I'm still going to do it!
        It's helpful not to enter passwords the whole time and it's only a local docker container anyway!

    * Do not worry about executing:

            ~/sqitch init ....

    The ./migrations directory already contains the sqitch.plan and sqitch.conf files that the above command would have created.

* Change to the project folder:

        cd ~/workspace/dvdrental

* Execute [pg_prove](https://github.com/theory/tap-parser-sourcehandler-pgtap), this is so that you can see the state of your database before doing anything with it:

        ~/pg_prove --ext .sql -r -h localhost -p 5432 -U dbo -d dvdrental -f ./pgprove

    If this is the first time the container is spun up, the output will be similar to:

        ./pgprove/cluster/cluster.sql .................................................................................................... ok
        ./pgprove/cluster/language/c.sql ................................................................................................. ok
        ./pgprove/cluster/language/internal.sql .......................................................................................... ok
        ./pgprove/cluster/language/plpgsql.sql ........................................................................................... ok
        ./pgprove/cluster/language/sql.sql ............................................................................................... ok
        ./pgprove/cluster/role/dbo.sql ................................................................................................... ok
        ./pgprove/cluster/role/pg_checkpoint.sql ......................................................................................... ok
        ./pgprove/cluster/role/pg_create_subscription.sql ................................................................................ ok
        ./pgprove/cluster/role/pg_database_owner.sql ..................................................................................... ok
        ./pgprove/cluster/role/pg_execute_server_program.sql ............................................................................. ok
        ./pgprove/cluster/role/pg_monitor.sql ............................................................................................ ok
        ./pgprove/cluster/role/pg_read_all_data.sql ...................................................................................... ok
        ./pgprove/cluster/role/pg_signal_backend.sql ..................................................................................... ok
        ./pgprove/cluster/role/pg_use_reserved_connections.sql ........................................................................... ok
        ./pgprove/cluster/role/pg_write_all_data.sql ..................................................................................... ok
        ./pgprove/cluster/role/pg_write_server_files.sql ................................................................................. ok
        ./pgprove/cluster/role/postgres.sql .............................................................................................. ok
        ./pgprove/cluster/tablespace/pg_default.sql ...................................................................................... ok
        ./pgprove/cluster/tablespace/pg_global.sql ....................................................................................... ok
        ./pgprove/dvdrental/dvdrental.sql ................................................................................................ 1/3
        not ok 3 - Database dvdrental should have the correct schemas.
        # Failed test 3: "Database dvdrental should have the correct schemas."
        #     Missing schemas:
        #         rental
        #         sqitch
        # Looks like you failed 1 test of 3
        ./pgprove/dvdrental/dvdrental.sql ................................................................................................ Failed 1/3 subtests
        ./pgprove/dvdrental/schemas/pg_catalog/extensions/plpgsql.sql .................................................................... ok
        .
        .
        .
        Files=1373, Tests=16418, 44 wallclock secs ( 2.62 usr  1.30 sys + 25.10 cusr  2.86 csys = 31.88 CPU)
        Result: FAIL

    The missing schemas and all related DDL, and DML are expected to fail at this point because the database has not yet been deployed:

    While [pg_prove](https://github.com/theory/tap-parser-sourcehandler-pgtap) is executing you should see in your [Docker Desktop](https://www.docker.com/products/docker-desktop/) something like this, see [here](./pgprove/pg_prove-screenshot.png) or
    if using docker [cli](https://docs.docker.com/engine/reference/commandline/cli/), see [here](./pgprove/pg_prove-docker-ps-screenshot.png).
* Execute [sqitch](https://sqitch.org/), but first check the status of your database:

        ~/sqitch status dvdrental --chdir ./migrations

    And again, if this is the first time the container is spun up, the output will be similar to:

        # On database dvdrental
        No changes deployed

    And if it's not the first time, the output may look something like this:

        # On database dvdrental
        # Project:  dvdrental
        # Change:   d66b0852cb72575d49adfee2931d2157db6f766f
        # Name:     data/store_store_id_seq
        # Tag:      @v0.2-data
        # Deployed: 2024-07-26 12:20:57 +0000
        # By:       SirSplat <sirsplat@dvdrental.com>
        #
        Undeployed changes:
          * indexes/actor_pk
          * indexes/address_pk
          * indexes/category_pk
          * indexes/city_pk
          * indexes/country_pk

    * So let's do a deployment:

        ~/sqitch deploy dvdrental --chdir ./migrations --to @v0.1-triggers

    And now you should see something similar to:

        Adding registry tables to dvdrental
        Deploying changes to dvdrental
          + appschema ................................................................. ok
          + data_types/mpaa_rating-ENUM ............................................... ok
          + data_types/year-DOMAIN .................................................... ok
          + functions/_group_concat(text-text)-func ................................... ok
          + functions/last_day(timestamp_without_time_zone)-func ...................... ok
          + functions/last_updated()-trg-func ......................................... ok
          .
          .
          .
          + foreign_keys/payment_customer_id_fk ....................................... ok
          + foreign_keys/payment_rental_id_fk ......................................... ok
          + foreign_keys/payment_staff_id_fk .......................................... ok
          + foreign_keys/rental_customer_id_fk ........................................ ok
          + foreign_keys/rental_inventory_id_fk ....................................... ok
          + foreign_keys/rental_staff_id_fk ........................................... ok
          + foreign_keys/staff_address_id_fk .......................................... ok
          + foreign_keys/store_address_id_fk .......................................... ok
          + foreign_keys/store_manager_staff_id_fk @v1.0-restore ...................... ok


    While [sqitch](https://sqitch.org/) is executing you should see in your [Docker Desktop](https://www.docker.com/products/docker-desktop/) something like this, see [here](./migrations/sqitch-screenshot.png) or
    if using docker [cli](https://docs.docker.com/engine/reference/commandline/cli/), see [here](./migrations/sqitch-docker-ps-screenshot.png).

Now you have the [DVDRental sample PostgreSQL database](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/) as it was designed (the good and the bad).

# Copyright and License
[MIT License](./LICENSE)
