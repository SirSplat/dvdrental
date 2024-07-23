# Introduction
This is the database we will be using for the duration of **Database design an introduction**

So either pull the image or build it yourself.

## Pull the image
```
docker pull sirsplat/dvdrental:latest
```

Execute the database tests first, this is so that you know the state of your database prior to doing anything with it.

**pgprove**

* Open your terminal.
* Navigate to your project root directory by running:
    ```
    cd ~/workspace/dvdrental
    ```
* Once inside the directory, you can use pg_prove by running:
    ```
    ~/pg_prove --ext .sql -r -h localhost -p 5555 -U dbo -d dvdrental -f /pgprove
    ```

    If this is the first time you are spinning up the container
