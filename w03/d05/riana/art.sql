CREATE TABLE artists(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE artworks(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  artist_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);