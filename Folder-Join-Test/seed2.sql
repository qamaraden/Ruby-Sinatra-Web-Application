DROP TABLE IF EXISTS location;

CREATE TABLE location (
  id SERIAL PRIMARY KEY,
  locationid INT,
  location VARCHAR(255),
  body TEXT
);

INSERT INTO location (locationid, location, body) VALUES ('1','ENGLAND', 'Thousands of events from all around England can be posted and viewed on this website.');
INSERT INTO location (locationid, location, body) VALUES ('2','GREECE', 'Thousands of events from all around Greec can be posted and viewed on this website.');
INSERT INTO location (locationid, location, body) VALUES ('3','DENMARK', 'Thousands of events from all around Denmark can be posted and viewed on this website.');
INSERT INTO location (locationid, location, body) VALUES ('4','ITALY', 'Thousands of events from all around Italy can be posted and viewed on this website.');
INSERT INTO location (locationid, location, body) VALUES ('5','FRANCE', 'Thousands of events from all around France can be posted and viewed on this website.');
