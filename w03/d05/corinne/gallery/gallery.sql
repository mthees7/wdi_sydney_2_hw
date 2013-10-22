CREATE TABLE artists
(
  id SERIAL4 PRIMARY KEY,
  artist_name VARCHAR(50) NOT NULL,
  dob TEXT,
  nationality TEXT
);

CREATE TABLE artworks (
  id SERIAL4 PRIMARY KEY,
  artwork_title TEXT,
  year TEXT,
  photo TEXT,
  artist_id SERIAL4,
  FOREIGN KEY (artist_id) references artists (id)
);

