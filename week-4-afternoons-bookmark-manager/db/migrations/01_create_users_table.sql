CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(60),
  password VARCHAR(140)
);