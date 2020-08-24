# ReForest Server

Server side for ReForest app (https://github.com/lib3rate/which-bin-app). This contains the database and all routing to communicate with the front-end

## Setup

Install dependencies with `npm install`.

## Creating The DB

If you are using the PostgreSQL installation provided in the vagrant environment: Use the `psql -U development` command to login to the PostgreSQL server with the username `development` and the password `development`.
If you are not using vagrant, you can create a development user, but it is not necessary.

Create a database with the command `CREATE DATABASE which_bin_app_development;`.

Copy the `.env.example` file to `.env.development` and fill in the necessary PostgreSQL configuration.

(For security reasons we cannot share our Sendgrid API key. In order to use the email sending feature get a Sendgrid API key at www.sendgrid.com)

```
PGHOST=localhost
PGUSER=development
PGDATABASE=which_bin_app_development
PGPASSWORD=development
PGPORT=5432
SENDGRID_API_KEY=
```


## Seeding Database

Run a the development server with `npm start` in the Host environment.

To reset the DB:

- Make a `GET` request to `/api/debug/reset` with `curl http://localhost:8001/api/debug/reset`.

or:

- Use the browser to navigate to `http://localhost:8001/api/debug/reset`.
