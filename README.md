# Run Angular 18 Karma Unit Tests in Docker

## Requires
* [Docker](https://www.docker.com/)

## Installation
1. Build docker container: `docker build -t angular-docker .`
2. Run Karma unit tests: `docker container run angular-docker ng test`

## Notes
* This was only tested on a 2023 MacBook Pro with M2 chip.