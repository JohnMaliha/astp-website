# ASTP

Website for the Association des sociétés techniques de Polytechnique.

## Build locally

Follow prereq steps [here](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll) or simply do:

```
$ sudo apt-get update
$ sudo apt-get install ruby bundler
$ bundle install
```

and then do:

```
$ bundle exec jekyll serve
```

## Deploy

Install `lftp`:

```
$ sudo apt-get install lftp
```

Set the following environment variables:

```
$ export FTP_URL=
$ export FTP_USER=
$ export FTP_PASSWORD=
```

Then do:

```
$ ./scripts/deploy.sh
```
