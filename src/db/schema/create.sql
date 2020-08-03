DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS bins CASCADE;
DROP TABLE IF EXISTS user_bins CASCADE;

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar,
  "email" varchar,
  "password" varchar
);

CREATE TABLE "bins" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "user_bins" (
  "id" SERIAL PRIMARY KEY,
  "user_id" INTEGER REFERENCES users(id) ON DELETE CASCADE,
  "bin_id" INTEGER REFERENCES bins(id) ON DELETE CASCADE,
  "score" INTEGER
);