# Introduction
A complete environment for the "Database Design, an Introduction" course.

# Initial Environment Setup
* Pull the [dvdrental database image](https://hub.docker.com/r/sirsplat/dvdrental)
* Clone [this repo](https://github.com/SirSplat/dvdrental)
* Pull the [pg_prove image](https://hub.docker.com/r/itheory/pg_prove)
    And follow "How to use this image"
* Pull the [sqitch image](https://hub.docker.com/r/sqitch/sqitch)
    And follow "How to use this image".

    To help you out a little, you'll need to do this:
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
    * As youre here (in your home directory), you might as well create a .pgpass file (not in the .sqitch directory!)
        if youre on a Windose machine, youre on your own.
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

# Process
* Open your terminal.
* Change to the project folder.
    ```
    cd ~/worspace/dvdrental
    ```
* Start a container.
    ```
    docker run -d --name dvdrental \
        --mount "type=bind,src=$(pwd)/db/conf.d,dst=/etc/postgresql/conf.d" \
        -e POSTGRES_PASSWORD=mysecretpassword \
        sirsplat/dvdrental:latest
    ```
* Execute the pg_prove first, this is so that you know the state of your database prior to doing anything with it.
    * Once inside the directory, you can use pg_prove by running:
        ```
        ~/pg_prove --ext .sql -r -h localhost -p 5555 -U dbo -d dvdrental -f ./pgprove
        ```
        If this is the first time the container is spunup, the output will be similar to:
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
* Execute the sqitch migrations.
    * But first check the status of your database.
    ```
    ~/sqitch status dvdrental --chdir ./migrations
    ```
    And again, if this is the first time the container is spunup, the output will be similar to:
    ```
    # On database dvdrental
    No changes deployed
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
* Add some data pgprove tests -> **WIP**