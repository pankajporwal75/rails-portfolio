# README

This is Backend Application built with rails to show dynamic content on React Portfolio using Rest API.

### Setup Process:

Install these dependencies:
``` bash
sudo apt-get install poppler-utils
sudo apt-get install imagemagick
sudo apt install libvips42
sudo apt install libvips-dev
```

Setup Postgres on your local system.

Change Settings in config/database.yml to setup your development database.

Run ``` bin/setup ``` to setup the application.

Run ``` rails db:migrate:status``` to check the status of migrations.

If all the migrations are up, you are good to go, if not, run ```rails db:migrate``` to run the down migrations

Once the schema is loaded, start your rails server by ```rails server```
