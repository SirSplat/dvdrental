# Introduction
A simple PostgreSQL cluster for use by the "Database Design, an Introduction" course.

# Initial Environment Setup
* Pull the [dvdrental database image](https://hub.docker.com/r/sirsplat/dvdrental)
* Clone [this repo](https://github.com/SirSplat/dvdrental)
* Pull the [pg_prove image](https://hub.docker.com/r/itheory/pg_prove)
    And follow "How to use this image"
* Pull the [sqitch image](https://hub.docker.com/r/sqitch/sqitch)
    And follow "How to use this image".

* To help you out a little, you'll need to do this:
    * Open your terminal.
    * Change to your home directory.
        ```
        cd ~
        ```
    * Create a .sqitch directory.
        ```
        mkdir .sqitch
        ```
    * Create a sqitch.conf in the .sqitch directory you just created.
        ```
        cat <<EOF > .sqitch/sqitch.conf
        [user]
	        name = Your Name
	        email = Your Email Address
        EOF
        ```
    * As you're here (in your home directory), you might as well create a .pgpass file (not in the .sqitch directory!)
        if you're on a Windose machine, you're on your own.
        ```
        cat <<EOF > ~/.pgpass
        *:*:*:*:mysecretpassword
        EOF
        ```
        ```
        chmod 0600 ~/.pgpass
        ```
        While this is breaking every rule about placing secrets in plain text in a git repo. I'm still going to do it!
        As it's helpful not to enter passwords the whole time and it's only a local docker container anyway.

    Do not worry about executing
    ```
    ~/sqitch init ....
    ```
    The ./migrations directory already contains the sqitch.plan and sqitch.conf files that the above command would have created.

# Process
* Open your terminal.
* Change to the project folder.
    ```
    cd ~/worspace/dvdrental
    ```
* Start a container.
    ```
    docker run -d \
        --name dvdrental \
        -e POSTGRES_PASSWORD=mysecretpassword \
        --mount "type=bind,src=$(pwd)/db/conf.d,dst=/etc/postgresql/conf.d" \
        -p 5555:5432 \
        sirsplat/dvdrental:latest
    ```
* Execute pg_prove, this is so that you can see the state of your database prior to doing anything with it.
    ```
    ~/pg_prove --ext .sql -r -h localhost -p 5555 -U dbo -d dvdrental -f ./pgprove
    ```
    If this is the first time the container is spun up, the output will be similar to:
    ```
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
    ```
    The missing schemas and all related DDL, DML is expected to fail at this point because the database has not yet been deployed.

    While pg_prove is executing you should see in your Docker Desktop something like this, see [here](./pgprove/pg_prove-scrrenshot.png) or
    if using the cmd line, see [here](./pgprove/pg_prove-docker-ps-screenshot.png).

    This is not a [pgTAP](https://pgtap.org/) tutorial but feel free to head on over to [pgTAP](https://pgtap.org/). In fact I encourage you to do so!
* Execute sqitch.
    * But first check the status of your database.
    ```
    ~/sqitch status dvdrental --chdir ./migrations
    ```
    And again, if this is the first time the container is spun up, the output will be similar to:
    ```
    # On database dvdrental
    No changes deployed
    ```
    And if it's not the first time, the output may look something like this:
    ```
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
    ```
    * So lets do a deployment.
    ```
    ~/sqitch deploy dvdrental --chdir ./migrations
    ```
    And now you should see something similar to:
    ```
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
    ```

    While sqitch is executing you should see in your Docker Desktop something like this, see [here](./migrations/sqitch-screenshot.png) or
    if using the cmd line, see [here](./migrations/sqitch-docker-ps-screenshot.png).

    This is not a sqitch tutorial but feel free to head on over to [sqitch](https://sqitch.org/). In fact I encourage you to do so!

* Add some pgtap data tests -> **WIP**