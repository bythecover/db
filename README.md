# Database
## Purpose of the Repo
To serve as a central location to store database schema and the Dockerfiles associated with the database.
## Goals
- [x] Run the database as a standalone container
- [x] Seed the database on initialization
- [ ] Run the database as a service in a docker-compose file in a separate repo
- [ ] Have a "Prod" startup configuration where the schema is implemented
- [ ] Have a "Dev" startup configuration where the schema is implemented and data is seeded

## Run the Database as a standalone container

Steps:
1. Verify docker is installed with `docker --version`
2. Change directory to the root of this repo
3. Build the image from the Docker file with `docker build -t db .`
4. Run the built image with `docker run -p 5432:5432 db` (This will expose the database on port 5432)

At this point the database is running as a container
