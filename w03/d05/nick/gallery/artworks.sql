CREATE TABLE artworks (
  id SERIAL4 PRIMARY KEY,
  artist_id SERIAL4,
  title TEXT,
  info TEXT,
  image TEXT,
  FOREIGN KEY (artist_id) references artists (id)
);
