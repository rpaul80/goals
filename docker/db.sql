CREATE DATABASE goals;
\c goals;

CREATE EXTENSION pgcrypto;  

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email       text not null unique,
    first_name  text not null,
    last_name   varchar not null,
    created     timestamp with time zone not null,
    updated     timestamp with time zone not null,
    deleted     timestamp with time zone not null
);

CREATE TABLE IF NOT EXISTS goals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id),
    title text not null,
    description text not null,
    created     timestamp with time zone not null,
    updated     timestamp with time zone not null,
    updated     timestamp with time zone not null   
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

INSERT INTO goals (user_id, title, description, created, updated)
VALUES (
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
