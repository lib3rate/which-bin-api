DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS waste CASCADE;
DROP TABLE IF EXISTS users_waste CASCADE;

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  -- "full_name" varchar,
  "email" varchar,
  "password" password
);

CREATE TABLE "waste" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "users_waste" (
  "id" SERIAL PRIMARY KEY,
  "user_id" INTEGER UNIQUE REFERENCES users(id) ON DELETE CASCADE,
  "waste_id" INTEGER UNIQUE REFERENCES waste(id) ON DELETE CASCADE,
  "score" INTEGER
);

-- ALTER TABLE "users_waste" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

-- ALTER TABLE "users_waste" ADD FOREIGN KEY ("waste_id") REFERENCES "waste" ("id");

-- CREATE TABLE user_waste (
--   id SERIAL PRIMARY KEY NOT NULL,
--   user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
--   recycling_id INTEGER UNIQUE REFERENCES recycling(id) ON DELETE CASCADE,
--   organic_id INTEGER UNIQUE REFERENCES organics(id) ON DELETE CASCADE,
--   garbage_id INTEGER UNIQUE REFERENCES garbage(id) ON DELETE CASCADE
-- );