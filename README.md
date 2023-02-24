# jubilant-computing-machine

This runs Vale using configuration that's supposed to help prose
be more plain language (per PlainLanguage.gov).

## Configuring

If the directory has a `.vale.ini` file in it, it'll be used;
otherwise, a basic file that will attempt to look at everything
will be used.

## Building

```sh
docker build -t PlainLanguage:latest .
```

## Running

```sh
docker run --rm -it -v "$(pwd):$(pwd)"  PlainLanguage:latest "$(pwd)"
```

## Credit

* [Vale](https://vale.sh/)
* [base image](https://hub.docker.com/r/jdkato/vale)
* [PlainLanguage rules](https://github.com/testthedocs/PlainLanguage)
