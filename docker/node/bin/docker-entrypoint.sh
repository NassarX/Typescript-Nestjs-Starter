#!/bin/sh
set -e

# Install deps
npm install

# Copy static files
if [ -d "public" ]
then
    cp -r public dist/public
fi

npm run start

## Start the server
exec "$@"
