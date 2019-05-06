DROP TABLE IF EXISTS post;

CREATE TABLE post (
  id SERIAL PRIMARY KEY,
  locationid INT,
  title VARCHAR(255),
  body TEXT
);

INSERT INTO post (locationid, title, body) VALUES ('1','event 1', 'Body Text 1');
INSERT INTO post (locationid, title, body) VALUES ('3','event 2', 'Body Text 2');
INSERT INTO post (locationid, title, body) VALUES ('2','event 3', 'Body Text 3');
INSERT INTO post (locationid, title, body) VALUES ('5','event 4', 'Body Text 4');
INSERT INTO post (locationid, title, body) VALUES ('4','event 5', 'Body Text 5');
INSERT INTO post (locationid, title, body) VALUES ('2','event 3', 'Body Text 3');
INSERT INTO post (locationid, title, body) VALUES ('3','event 2', 'Body Text 2');
