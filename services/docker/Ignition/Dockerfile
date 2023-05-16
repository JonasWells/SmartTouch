# Specify MariaDB version
ARG AGENT_VERSION_TAG=latest
# Set the Base Image for the Dockerfile
FROM kcollins/ignition:${AGENT_VERSION_TAG}

###
# Do any tweaking or adjustments to Base Image
###

###
# Set any optional or required environmental variables
###

# Required Params

# Tuning Params

# Optional Params
ENV ACCEPT_IGNITION_EULA Y
ENV GATEWAY_RESTORE_DISABLED true
ENV GATEWAY_ADMIN_USERNAME admin
ENV GATEWAY_ADMIN_PASSWORD password
ENV GATEWAY_HTTP_PORT 8088
ENV GATEWAY_HTTPS_PORT 8043
ENV IGNITION_EDITION standard
ENV DISABLE_QUICKSTART true

###
# Re-exposing any existing (i. e. base image) Docker params, for clarity/reference
###

# Docker Ports
EXPOSE ${GATEWAY_HTTP_PORT}
EXPOSE ${GATEWAY_HTTPS_PORT}

