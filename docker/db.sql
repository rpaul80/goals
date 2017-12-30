CREATE DATABASE goals;
\c goals;

CREATE EXTENSION pgcrypto;

DROP TABLE IF EXISTS goals;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS circles;
DROP TABLE IF EXISTS comments;

CREATE TABLE IF NOT EXISTS circles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title  varchar not null,
    description  text not null,
    created     timestamp with time zone not null,
    updated     timestamp with time zone not null,
    deleted     timestamp with time zone
);

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email       varchar not null unique,
    first_name  varchar not null,
    last_name   varchar not null,
    created     timestamp with time zone not null,
    updated     timestamp with time zone not null,
    deleted     timestamp with time zone
);

CREATE TABLE IF NOT EXISTS circle_members (
    circle_id UUID REFERENCES circles(id),
    user_id   UUID REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS goals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id),
    title text not null,
    description text not null,
    circle_id   UUID REFERENCES circles(id),
    created     timestamp with time zone not null,
    updated     timestamp with time zone not null,
    deleted     timestamp with time zone
);

CREATE TABLE IF NOT EXISTS comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id),
    goal_id UUID REFERENCES goals(id),
    body text not null,
    created     timestamp with time zone not null,
    updated     timestamp with time zone not null
);

INSERT INTO circles (id, title, description, created, updated)
VALUES(
    'e46b3c2e-83b5-434b-a37e-152aad47db63',
    'Family 2018',
    'New Years Resolutions for the Pauls',
    'January 8 04:05:06 1999 PST',
    'January 8 04:05:06 1999 PST'
);

INSERT INTO users (id, email, first_name, last_name, created, updated)
VALUES (
    'c4c4c474-bd96-489f-a0e2-6c46b400b6d1',
    'raj@bar.com',
    'Raj',
    'Paul',
    'January 8 04:05:06 1999 PST',
    'January 8 04:05:06 1999 PST'
);

INSERT INTO users (id, email, first_name, last_name, created, updated)
VALUES (
    '3676bb18-462e-4a4c-a4e7-401647f33414',
    'heena@bar.com',
    'Heena',
    'Gandhi',
    'January 8 04:05:06 2017 PST',
    'January 8 04:05:06 2017 PST'
);

INSERT INTO users (id, email, first_name, last_name, created, updated)
VALUES (
    '3a151899-5af3-4429-8a0a-715da290eb2b',
    'divya@bar.com',
    'Divya',
    'Bear',
    'December 8 04:05:06 2017 PST',
    'December 8 04:05:06 2017 PST'
);

INSERT INTO users (id, email, first_name, last_name, created, updated)
VALUES (
    'cb660734-b7e0-467b-b437-26048397d3f3',
    'amaya@bar.com',
    'Amaya',
    'Bird',
    'July 24 04:05:06 2017 PST',
    'July 24 04:05:06 2017 PST'
);

INSERT INTO goals (user_id, title, description, created, updated)
VALUES (
    'c4c4c474-bd96-489f-a0e2-6c46b400b6d1',
    'Increase awesomeness',
    'Increase awesomeoness by 40%',
    'July 24 04:05:06 2017 PST',
    'July 24 04:05:06 2017 PST'
);

INSERT INTO goals (user_id, title, description, created, updated)
VALUES (
    '3676bb18-462e-4a4c-a4e7-401647f33414',
    'Eat some meat',
    'Chicken is pretty lovely, so give it a shot.',
    'July 24 04:05:06 2017 PST',
    'July 24 04:05:06 2017 PST'
);

INSERT INTO goals (id, user_id, title, description, created, updated)
VALUES (
    '24ab95b5-3f38-42f1-a664-a94439d99ed7',
    '3a151899-5af3-4429-8a0a-715da290eb2b',
    'Decrease tantrums',
    'Decrease tantrums by 30%',
    'July 24 04:05:06 2017 PST',
    'July 24 04:05:06 2017 PST'
);

INSERT INTO goals (user_id, title, description, created, updated)
VALUES (
    'cb660734-b7e0-467b-b437-26048397d3f3',
    'Be less shy',
    'Sing a song in front of my family',
    'July 24 04:05:06 2017 PST',
    'July 24 04:05:06 2017 PST'
);

INSERT INTO circle_members(circle_id, user_id)
VALUES
(
    'e46b3c2e-83b5-434b-a37e-152aad47db63',
    '3a151899-5af3-4429-8a0a-715da290eb2b'
),
(
    'e46b3c2e-83b5-434b-a37e-152aad47db63',
    'cb660734-b7e0-467b-b437-26048397d3f3'
),
(
    'e46b3c2e-83b5-434b-a37e-152aad47db63',
    '3676bb18-462e-4a4c-a4e7-401647f33414'
),
(
    'e46b3c2e-83b5-434b-a37e-152aad47db63',
    'c4c4c474-bd96-489f-a0e2-6c46b400b6d1'
);

INSERT INTO comments(user_id, goal_id, body, created, updated)
VALUES
(
    '3a151899-5af3-4429-8a0a-715da290eb2b',
    '24ab95b5-3f38-42f1-a664-a94439d99ed7',
    'Good job!',
    'July 24 04:05:06 2017 PST',
    'July 24 04:05:06 2017 PST'
),
(
    'cb660734-b7e0-467b-b437-26048397d3f3',
    '24ab95b5-3f38-42f1-a664-a94439d99ed7',
    'Great goal - rooting for',
    'July 24 04:05:06 2017 PST',
    'July 24 04:05:06 2017 PST'
);