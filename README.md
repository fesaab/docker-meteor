# docker-meteor
Automatically build Meteor 1.3 apps with Docker.

## Description
This is a simple Dockerfile for running Meteor 1.3+ with Docker. This implements the new NPM integration included in Meteor 1.3, and installs all necessary NPM modules.

## Build docker image
Just place all the files into the root of your Meteor installation. Then execute the build command by running:

```
./dockerbuilddeploy.sh saab-tools 2.0.0
```

This will build a Docker image with the appropriate tag (ex. saab/saab-tools:2.0.0).

## Run docker image
To run the docker image just copy and update the .dockerenv.sample to a .dockerenv file and run:

```
docker run --env-file .dockerenv -d -p 3000:3000 saab/saab-tools:2.0.0
```

The -d is to run in background and the -p is to map the port 3000 on the docker daemon to the port 3000 on the host.