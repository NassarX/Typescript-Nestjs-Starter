# Set Node.js Alpine version
ARG NODE_ALPINE_VERSION=16-alpine

# Base image
FROM node:${NODE_ALPINE_VERSION}
MAINTAINER Mahmoud Nassar <mahmoud@nassarx.com>

# Set WORKDIR
ARG APP_WORKDIR=/usr/src/app
WORKDIR ${APP_WORKDIR}

# Add docker-entrypoint
COPY ./bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

# Set docker entry point
ENTRYPOINT ["docker-entrypoint"]

ENV PORT=3000


# Set default command to start the server
CMD ["npm", "run", "start:dev"]
