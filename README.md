# EDIB packaging test

Elixir Docker Image Packager test setup for different CI services

## Links

- [About EDIB](https://github.com/edib-tool/elixir-docker-image-packager)
- [mix-edib](https://github.com/edib-tool/mix-edib)
- [EDIB tool (docker image)](https://github.com/edib-tool/docker-edib-tool)

----

## Travis CI ![status](https://img.shields.io/badge/docker-ok-brightgreen.svg?style=flat-square) [![Build Status](https://img.shields.io/travis/edib-tool/edib-app-test-ci.svg?style=flat-square)](https://travis-ci.org/edib/edib-app-test-ci) ![happiness](https://img.shields.io/badge/happiness-yay-33ccff.svg?style=flat-square)

### Notes

- `--rm` seems to be okay to use.
- Must install Elixir via Ubuntu package (`language: elixir` does not work).
- Use `language: ruby` instead.
- Also do not forget to set `sudo: required`, because we install OS packages.

See: <http://docs.travis-ci.com/user/docker/>

----

## CircleCI ![status](https://img.shields.io/badge/docker-fail-red.svg?style=flat-square) ![happiness](https://img.shields.io/badge/happiness-meh-663300.svg?style=flat-square)

### Notes

- `docker run`: Never use `--rm`, it always fails.
- Something in the container _segfaults_, no idea what and why (and not interest in figuring out, because it's no fun).
- `--privileged` does not have any effect.
- It runs a pretty old and custom docker version (_1.6.2-circleci_).
- Also a newer version (1.8.3) does not help.

See: <https://circleci.com/docs/docker>

----

## Wercker ![status](https://img.shields.io/badge/docker-fail-red.svg?style=flat-square) ![happiness](https://img.shields.io/badge/happiness-meh-663300.svg?style=flat-square)

### Notes

- Getting docker running in the docker container ... is an impossible thing.
- Docker-in-Docker seems not working for this service.
- Perhaps the outer container is missing the `--privileged` flag.

See: <http://devcenter.wercker.com/docs/pipelines/stacks.html>

----

## Shippable ![status](https://img.shields.io/badge/docker-fail-red.svg?style=flat-square) ![happiness](https://img.shields.io/badge/happiness-meh-663300.svg?style=flat-square)

### Notes

- Similar to Travis (can even use their `.travis.yml`), but seems not to support running docker itself (in CI step).
- Would perhaps need a Docker-in-Docker approach. (within Pre-CI/Post-CI workflow)

See: <http://docs.shippable.com/docker_build/>

----

## Other service? ![status](https://img.shields.io/badge/docker-%3F%3F%3F-aaaaaa.svg?style=flat-square) ![happiness](https://img.shields.io/badge/happiness-%3F%3F%3F-aaaaaa.svg?style=flat-square)

Tell me which one to try.

It **must** run docker, of course!
