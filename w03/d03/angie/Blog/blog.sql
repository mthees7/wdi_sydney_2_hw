CREATE TABLE posts
(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  body TEXT,
  image TEXT,
  category TEXT,
  created_at TIMESTAMP
);