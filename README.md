![Docker Logo](images/docker-logo-blue-h33.png)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![GitHub Logo](images/GitHub_Logo_h33.png)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![Postman Logo](images/Postman-Logo-h33.png)
# Docker Image :: GitHub Runner : Postman

## Docker Login

Prerequesite: GitHub Access Token with the following scopes:
* read:packages
* write:packages

```shell
docker login ghcr.io -u <your GitHub username here>
```

## Docker Image Build

```shell
docker build \
    --platform linux/amd64 \
    --no-cache \
    --tag ghcr.io/eigenherd/docker-image-github-runner-postman:latest \
    .
```

## Docker Image Push

```shell
docker image push \
    --all-tags \
    ghcr.io/eigenherd/docker-image-github-runner-postman
```