COPY option (poll_event_id, name, image) FROM '/docker-entrypoint-initdb.d/options.txt' DELIMITER ',' CSV HEADER;