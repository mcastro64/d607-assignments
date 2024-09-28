USE marcocastro64;

CREATE TABLE survey_movies (
    movie_id int,
    title varchar(255),
    UNIQUE KEY(movie_id)
);

CREATE TABLE survey_participants (
    participant_id int,
    FirstName varchar(100),
    LastName varchar(100),
    UNIQUE KEY(participant_id)
);

CREATE TABLE survey_movie_ratings (
    response_id int,
    movie_id int,
    participant_id int,
    rating int,
    PRIMARY KEY (response_id),
    FOREIGN KEY (movie_id) REFERENCES survey_movies(movie_id),
    FOREIGN KEY (participant_id) REFERENCES survey_participants(participant_id)
);