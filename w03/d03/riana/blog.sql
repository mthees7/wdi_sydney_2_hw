DROP TABLE posts CASCADE;
DROP TABLE comments CASCADE;

CREATE TABLE posts(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  category VARCHAR(20) NOT NULL,
  body TEXT NOT NULL,
  image TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

INSERT INTO posts(title, category, body, image) VALUES('Day 1', 'Programming' ,'Day 3 through week 1 and I have learned how to program server side code with Ruby.','/img1.jpg');
INSERT INTO posts(title, category, body, image) VALUES('Day 2', 'Programming' ,'Day 4 through week 1 and I have learned how to program server side code with Ruby.','/img1.jpg');
INSERT INTO posts(title, category, body, image) VALUES('Day 3', 'Programming' ,'Day 5 through week 1 and I have learned how to program server side code with Ruby.','/img1.jpg');
INSERT INTO posts(title, category, body, image) VALUES('Day 4', 'Programming' ,'Day 1 through week 2 and I have learned how to program server side code with Ruby.','/img1.jpg');
INSERT INTO posts(title, category, body, image) VALUES('Day 5', 'Programming' ,'Day 2 through week 2 and I have learned how to program server side code with Ruby, build websites with HTML and CSS using the Sinatra framework.','/img1.jpg');
INSERT INTO posts(title, category, body, image) VALUES('Day 6', 'Programming' ,'Day 3 through week 2 and I have learned how to program server side code with Ruby, build websites with HTML and CSS using the Sinatra framework.','/img1.jpg');
INSERT INTO posts(title, category, body, image) VALUES('Day 7', 'Programming' ,'Day 4 through week 2 and I have learned how to program server side code with Ruby, build websites with HTML and CSS using the Sinatra framework.','/img1.jpg');
INSERT INTO posts(title, category, body, image) VALUES('Day 8', 'Programming' ,'Day 5 through week 2 and I have learned how to program server side code with Ruby, build websites with HTML and CSS using the Sinatra framework.','/img1.jpg');
INSERT INTO posts(title, category, body, image) VALUES('Day 9', 'Programming' ,'Day1 through week 3 and I have learned how to program server side code with Ruby, build websites with HTML and CSS using the Sinatra framework and storing data in the postgress database.','/img1.jpg');
INSERT INTO posts(title, category, body, image) VALUES('Day 10', 'Programming' ,'Day 2 through week 3 and I have learned how to program server side code with Ruby, build websites with HTML and CSS using the Sinatra framework and storing data in the postgress database.','/img1.jpg');
INSERT INTO posts(title, category, body, image) VALUES('Day 11', 'Programming' ,'Halfway through week 3 and I have learned how to program server side code with Ruby, build websites with HTML and CSS using the Sinatra framework and storing data in the postgress database.','/img1.jpg');

CREATE TABLE comments(
  id SERIAL4 PRIMARY KEY,
  participant VARCHAR(50) NOT NULL,
  comment TEXT NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  post_id serial4,
  FOREIGN KEY (post_id) REFERENCES posts (id)
)

INSERT INTO comments(participant, comment) VALUES ('fuzzy','comment1');
INSERT INTO comments(participant, comment) VALUES ('lumpkin','comment2');
INSERT INTO comments(participant, comment) VALUES ('bubbles','comment3');