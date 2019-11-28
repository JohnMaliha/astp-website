# ASTP

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

Install `lftp`:

```bash
$ sudo apt-get install lftp
```

Set the following environment variables:

```bash
$ export FTP_URL=
$ export FTP_USER=
$ export FTP_PASSWORD=
```

Then do:

```bash
$ ./scripts/build.sh
$ ./scripts/deploy.sh
```
