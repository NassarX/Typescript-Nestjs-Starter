<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="120" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest
  

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript Dockerized starter repository.

## Installation & Running the app

```bash
$ make up
```

That's it! You can now access the app at http://localhost:3000

In background mode it will run following commands:

```bash
# clone nestjs/typescript-starter repo into app directory & delete .git
$ git clone https://github.com/nestjs/typescript-starter.git app && rm -rf app/.git

# build and run nodejs docker container
$ docker-compose up

# install dependencies
$ npm install

# development
$ npm run start

# watch mode
$ npm run start:dev
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```
