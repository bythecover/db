CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    is_author BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE poll_events (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expiration_date TIMESTAMP NOT NULL,
    expired BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE option (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    poll_event_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    FOREIGN KEY (poll_event_id) REFERENCES poll_events (id) ON DELETE CASCADE
);

CREATE TABLE votes (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    selection INTEGER NOT NULL,
    poll_event_id INTEGER NOT NULL,
    time_submitted TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    source VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (poll_event_id) REFERENCES poll_events (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (selection) REFERENCES option (id) ON DELETE CASCADE
);

CREATE TABLE poll_results (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    poll_event_id INTEGER NOT NULL,
    winner INTEGER NOT NULL,
    FOREIGN KEY (poll_event_id) REFERENCES poll_events (id) ON DELETE CASCADE,
    FOREIGN KEY (winner) REFERENCES option (id) ON DELETE CASCADE
);

INSERT INTO users (first_name, last_name, email)
    VALUES ('John', 'Doe', 'johndoe@yahoo.com');

INSERT INTO users (first_name, last_name, email, is_author)
    VALUES ('Brandon', 'Sanderson', 'johndoe@yahoo.com', TRUE);