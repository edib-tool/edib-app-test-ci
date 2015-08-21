# EDIP packaging test

Elixir Docker Image Packager test setup for different CI services

## Links

- [About EDIP](https://github.com/asaaki/elixir-docker-image-packager)
- [mix-edip](https://github.com/asaaki/mix-edip)
- [EDIP tool (docker image)](https://github.com/asaaki/docker-images/tree/master/dockerfiles/edip-tool/0.4.3)

----

## Travis CI ![status](https://img.shields.io/badge/docker-ok-brightgreen.svg?style=flat-square) [![Build Status](https://img.shields.io/travis/asaaki/edip-app-test-ci.svg?style=flat-square)](https://travis-ci.org/asaaki/edip-app-test-ci) ![happiness](https://img.shields.io/badge/happiness-yay-33ccff.svg?style=flat-square)

### Notes

- `docker run`: definitely needs `--privileged`!
- `--rm` seems to be okay to use (tested in `make check` target).
- Must install Elixir via Ubuntu package (`language: elixir` does not work).

----

## CircleCI ![status](https://img.shields.io/badge/docker-fail-red.svg?style=flat-square) ![happiness](https://img.shields.io/badge/happiness-meh-663300.svg?style=flat-square)

### Notes

- `docker run`: Never use `--rm`, it always fails.
- Something in the container _segfaults_, no idea what and why (and not interest in figuring out, because it's no fun).
- `--privileged` does not have any effect.
- It runs a pretty old and custom docker version (_1.6.2-circleci_).

----

## Wercker ![status](https://img.shields.io/badge/docker-fail-red.svg?style=flat-square) ![happiness](https://img.shields.io/badge/happiness-meh-663300.svg?style=flat-square)

### Notes

- Getting docker running in the docker container ... is an impossible thing.
- Docker-in-Docker seems not working for this service.
- Perhaps the outer container is missing the `--privileged` flag.

----

## Shippable ![status](https://img.shields.io/badge/docker-fail-red.svg?style=flat-square) ![happiness](https://img.shields.io/badge/happiness-meh-663300.svg?style=flat-square)

### Notes

- Similar to Travis (can even use their `.travis.yml`), but seems not to support running docker itself.
- Would perhaps need a Docker-in-Docker approach. (Which failed for wercker already.)

----

## Other service? ![status](https://img.shields.io/badge/docker-%3F%3F%3F-aaaaaa.svg?style=flat-square) ![happiness](https://img.shields.io/badge/happiness-%3F%3F%3F-aaaaaa.svg?style=flat-square)

Tell me which one to try.

It **must** run docker, of course!
