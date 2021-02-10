# ASTP

[![Proofing status](https://github.com/christophebedard/astp-website/workflows/Proofing/badge.svg)](https://github.com/christophebedard/astp-website/actions?query=workflow%3AProofing)
[![Automatic deployment status](https://github.com/christophebedard/astp-website/workflows/Automatic%20deployment/badge.svg)](https://github.com/christophebedard/astp-website/actions?query=workflow%3A%22Automatic+deployment%22)

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

Or simply:

```bash
$ ./scripts/build.sh
$ ./scripts/serve.sh
```

## Deploy

Docker is required.

Build the website and then build the Docker image and push to registry:

```bash
$ ./scripts/build.sh
$ ./scripts/deploy.sh
```

Note that deployment is automated using a GitHub action triggered when pushing on `master`, see [`deploy.yml`](.github/workflows/deploy.yml).

## Test

To deploy locally and test:

```bash
$ ./scripts/test_deploy.sh
```

It will launch an instance of an nginx image serving the static files and will open the local website in Chrome.
