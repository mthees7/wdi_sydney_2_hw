CREATE TABLE artists
(
  id Serial4 PRIMARY KEY,
  name TEXT,
  nationality TEXT,
  dob DATE
  );

  CREATE TABLE artworks
  (
  id Serial4 PRIMARY KEY,
  title TEXT,
  image TEXT,
  style TEXT,
  year DATE
  );