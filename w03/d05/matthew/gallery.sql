CREATE TABLE artist(
  id SERIAL4 PRIMARY KEY,
  name TEXT,
  picture TEXT,
  country TEXT
);

CREATE TABLE works(
  id SERIAL4 PRIMARY KEY,
  artist_id SERIAL4,
  title TEXT,
  image TEXT,
  year TEXT
);