CREATE TABLE comments (
  id SERIAL4 PRIMARY KEY,
  post_id SERIAL4,
  comment_body TEXT,
  comment_title TEXT,
  author TEXT,
  created_at TIMESTAMP,
  FOREIGN KEY (post_id) references posts (id)
);