
CREATE DATABASE recordcollection;

\c recordcollection;

CREATE TABLE albums (id SERIAL PRIMARY KEY, band VARCHAR(255), title VARCHAR(255), release_date INT, no_of_songs INT, cover VARCHAR(255));

INSERT INTO albums (band, title, release_date, no_of_songs, cover) VALUES ('Radiohead', 'Pablo Honey', 1993, 12, 'https://upload.wikimedia.org/wikipedia/en/0/0f/Radiohead.pablohoney.albumart.jpg');