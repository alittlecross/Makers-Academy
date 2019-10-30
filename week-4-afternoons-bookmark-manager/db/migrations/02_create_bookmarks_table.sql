CREATE TABLE bookmarks(
  bookmark_id SERIAL PRIMARY KEY,
  title VARCHAR(60),
  url VARCHAR(60),
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);
