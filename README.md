# Docker example


## Build image

```
docker build -t hughluo/docker-example:1.0.0 .
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