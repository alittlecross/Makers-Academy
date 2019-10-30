CREATE TABLE tags(
  tag VARCHAR(60),
  bookmark_id INT,
  FOREIGN KEY (bookmark_id) REFERENCES bookmarks (bookmark_id)
);
