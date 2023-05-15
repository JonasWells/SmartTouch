# Specify MariaDB version
ARG AGENT_VERSION_TAG=latest
# Set the Base Image for the Dockerfile
FROM mariadb:${AGENT_VERSION_TAG}

###
# Do any tweaking or adjustments to Base Image
###

# Create tables for SmartTouch storage
COPY Scripts/MariaDB_Init.sql /docker-entrypoint-initdb.db/

###
# Set any optional or required environmental variables
###

# Required Params
ENV MARIADB_ROOT_PASSWORD mariadb_root

# Tuning Params

# Optional Params
ENV MARIADB_USER mariadb
ENV MARIADB_PASSWORD mariadb
ENV MARIADB_DATABASE smarttouch_db

###
# Re-exposing any existing (i. e. base image) Docker params, for clarity/reference
###

# Docker Ports
EXPOSE 3306