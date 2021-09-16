# Wandera openjdk docker images

## Description
Set of dockerfiles for building docker images used in Wandera as base images for Java based services.

## Maintainers
* Jiri Sedlacek
* Jakub Coufal

## Structure
There is a directory for each major version of OpenJDK we want to use.
* `11`
* `15`
* `17`

For each major version there are directories for different image types with specific `Dockerfile`

## Update and release process

### How to update minor/micro version of specific OpenJDK major version
* Update OpenJDK base image version in specific Dockerfiles

### How to add new major version
* Create new directory in project root named by this version, then create image type directories inside 
  and define new Dockerfiles
* For new major version builds needs to be configured in  [wandera dockerhub](https://hub.docker.com/r/wanderadock/openjdk), 
  ask maintainer 
  
### How to release new version
* When changes are merged to `master` branch, docker builds are automatically triggered and new images
  with `latest` tags will appear in   [wandera dockerhub](https://hub.docker.com/r/wanderadock/openjdk/tags?page=1&ordering=last_updated) 
  (e.g. `15-slim-latest` or `11-slim-zsfse-latest`)
* When the `latest` image is tested and you are satisfied, ask maintainer to make GitHub release. New GitHub release will build 
  new docker images with production tags (e.g. `15-slim-lzfse`)
