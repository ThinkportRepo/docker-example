# Docker example


## Build image

Build docker image based on the current workdir (denoted by `.`) by following the instruction in `./Dockerfile` give it tag `hughluo/docker-example:1.0.0`. (pattern for tag: `<repo url>/<image name>:<image version>`).
```
docker build -t hughluo/docker-example:1.0.0 .
```

## Push to Docker Hub
```
docker login
```
```
docker push hughluo/docker-example:1.0.0
```

## Run container based on the image
 
Run a docker container based on image `hughluo/docker-example:1.0.0` and publish the containers `8080` port to `localhost:9090`.

```
docker run -d -p 9090:8080 hughluo/docker-example:1.0.0
```

..., and set environment variable `LOCATION` to `Germany`.
and pass argument `Brendan` `Eich`.

```
docker run -d -p 9090:8080 --env LOCATION=Germany hughluo/docker-example:1.0.0 Brendan Eich
```

## Debug container

Modify Dockerfile to let it fail. In this example we modify it to `ENTRYPOINT [ "node", "server-not-exist.js" ]` so that node will not find the js file to run.
```
sed "s/server.js/server-not-exist.js/" Dockerfile > BadDockerfile

```

Build docker image based on the current workdir (denoted by `.`) and by following the instruction in `./BadDockerfile`. 
```
docker build -f BadDockerfile -t hughluo/baddocker-example:1.0.0 .
```

```
docker run -d -p 9090:8080 --name badcontainer hughluo/baddocker-example:1.0.0 
```

Check all containers (including dead containers)
```
docker ps -a
```

```
docker image inspect hughluo/baddocker-example:1.0.0
docker inspect badcontainer 
docker logs badcontainer
```
