DROP DATABASE Club_iot;
CREATE DATABASE Club_iot;

USE Club_iot;

CREATE TABLE `users` (
  `id` int PRIMARY KEY,
  `total_votes` int
);

CREATE TABLE `processed_votes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `played_song_id` int NOT NULL,
  `total_score` int,
  `total_votes` int
);

CREATE TABLE `songs` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `song_name` varchar(255),
  `artist_id` int,
  `album_id` int,
  `genre_id` int,
  `length` time
);

CREATE TABLE `played_songs` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `song_id` int,
  `time_stamp` datetime
);

CREATE TABLE `artists` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `albums` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `artist_id` int
);

CREATE TABLE `genres` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

ALTER TABLE `played_songs` ADD FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`);

ALTER TABLE `processed_votes` ADD FOREIGN KEY (`played_song_id`) REFERENCES `played_songs` (`id`);

ALTER TABLE `songs` ADD FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`);

ALTER TABLE `songs` ADD FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`);

ALTER TABLE `songs` ADD FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

ALTER TABLE `albums` ADD FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`);

CREATE USER 'test'@'localhost' IDENTIFIED BY 'test';

GRANT ALL PRIVILEGES ON *.* TO 'test'@'localhost' WITH GRANT OPTION;

CREATE USER 'test'@'%' IDENTIFIED BY 'test';

GRANT ALL PRIVILEGES ON *.* TO 'test'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

