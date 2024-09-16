# Run Angular 18 Karma Unit Tests in Docker

## Structure
* .github/workflows/test.yml: Workflow to run tests in app folder within the Docker container specified in ./dockerfile.
* app: A basic Angular 18 app with tests that should pass.
* dockerfile: Configuration for a Docker container that you can use on your local machine or put on [DockerHub](https://hub.docker.com/)

## To run tests on local machine

### Requires
* [Docker](https://www.docker.com/)

### Installation
1. Open this repo's base directory in terminal.
2. Build docker container: `docker build -t angular-docker .`
3. Run Karma unit tests: `docker container run angular-docker ng test`

## Notes
* Read more on my [blog post](https://adammaus.com/wp/2024/09/run-angular-18-karma-unit-tests-in-docker/).
* This was only tested on a 2023 MacBook Pro with M2 chip.
* If you make changes to the app or tests, you will need to rebuild the Docker container and rerun the tests. Here is the one liner: `docker build -t angular-docker .; docker container run angular-docker ng test`