DROP TABLE IF EXISTS eventlocation;

CREATE TABLE eventlocation AS (
SELECT location.locationid, post.title, location.location FROM post INNER JOIN location ON location.locationid = post.locationid
);
