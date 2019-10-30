CREATE TABLE comments(
  comment_id SERIAL PRIMARY KEY,
  comment VARCHAR(240),
  bookmark_id INT,
  FOREIGN KEY (bookmark_id) REFERENCES bookmarks (bookmark_id)
);
