# ASTP

[![Build Status](https://travis-ci.org/christophebedard/astp-website.svg?branch=master)](https://travis-ci.org/christophebedard/astp-website)

Website for the Association des sociétés techniques de Polytechnique.

## Build locally

Follow prereq steps [here](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll) or simply do:

```bash
$ sudo apt-get update
$ sudo apt-get install ruby bundler
$ bundle install
```

and then do:

```bash
$ bundle exec jekyll build
```

or this to serve and open a browser:

```bash
$ bundle exec jekyll serve
```

## Deploy

Docker is required.

Build the website and then build the Docker image and push to registry:

```bash
$ ./scripts/build.sh
$ ./scripts/deploy.sh
```

## Test

To deploy locally and test:

```bash
$ ./scripts/test_deploy.sh
```

It will launch an instance of an nginx image serving the static files and will open the local website in Chrome.
