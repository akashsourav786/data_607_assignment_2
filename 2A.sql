CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL
);

CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    movie_title VARCHAR(100) NOT NULL
);

CREATE TABLE ratings (
    rating_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

INSERT INTO movies (movie_title)
VALUES
    ('Oppenheimer'),
    ('Barbie'),
    ('Dune: Part Two'),
    ('Inside Out 2'),
    ('Deadpool & Wolverine'),
    ('The Batman');

SELECT * FROM movies;

INSERT INTO users (user_name)
VALUES
    ('Alex'),
    ('Michael'),
    ('Sam'),
    ('David'),
    ('Chris');

SELECT * FROM users;

INSERT INTO ratings (user_id, movie_id, rating)
VALUES
    (1, 1, 5),
    (1, 2, 4),
    (1, 3, 5),
    (1, 5, 4),

    (2, 1, 5),
    (2, 3, 4),
    (2, 4, 3),
    (2, 6, 5),

    (3, 2, 5),
    (3, 3, 4),
    (3, 5, 5),

    (4, 1, 4),
    (4, 2, 3),
    (4, 4, 5),
    (4, 6, 4),

    (5, 2, 4),
    (5, 3, 5),
    (5, 4, 4),
    (5, 5, 3);

SELECT * FROM ratings;

SELECT
    users.user_name,
    movies.movie_title,
    ratings.rating
FROM ratings
JOIN users
    ON ratings.user_id = users.user_id
JOIN movies
    ON ratings.movie_id = movies.movie_id;

