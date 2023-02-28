# jubilant-computing-machine

The General Services Administration (GSA) provides guidance on using
plain language when communicating in writing.

> Plain language makes it easier for the public to read, understand,
> and use government communications.

This runs Vale using configuration that's supposed to help prose
be more plain language.

Read more at [https://www.plainlanguage.gov/](PlainLanguage.gov).

Chris Chinchilla ([https://chrischinchilla.com/](website))
([https://github.com/ChrisChinchilla](GitHub)) curates a series of
style rules for Vale.  Vale is an open-source command-line tool to
give stylistic feedback to writers of content.  The intention of these
style rules is to help writers write using language that's more readable
and accessible.

## This tool

This is a containerized tool run from the command-line that includes
Vale and a variety of style rules that tests prose.


### CI/CD scanning
[https://github.com/marketplace/actions/run-languagetool-with-reviewdog](LanguageTool Action)
may be more appropriate for scanning as a part of a CI/CD system.
This action already includes the scaffolding to surface the scan results
more cleanly, such as PR (Pull Request) comments.

## Building

```sh
docker build \
  -t PlainLanguage:latest \
  .
```

## Running

```sh
docker run \
  --rm \
  -it \
  -w "$(pwd)" \
  -v "$(pwd):$(pwd)" \
  -v "${HOME}/.valestyles:/styles" \
  -u "$(id -u)" \
  PlainLanguage'
```

## Credit

* [Vale](https://vale.sh/)
* [base image](https://hub.docker.com/r/jdkato/vale)
* [PlainLanguage rules](https://github.com/testthedocs/PlainLanguage)
