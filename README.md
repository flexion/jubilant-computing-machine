# jubilant-computing-machine

The General Services Administration (GSA) provides guidance on using
plain language when communicating in writing.

> Plain language makes it easier for the public to read, understand,
> and use government communications.

This runs Vale using configuration that's supposed to help prose
be more plain language.

Read more at [PlainLanguage.gov][PlainLanguage.gov].

Chris Chinchilla ([ChrisChincilla.com][ChrisChincilla.com] /
[GitHub.com/ChrisChincilla][GitHub.com/ChrisChincilla])
curates a series of [style rules][style rules] for Vale.  [Vale][Vale]
is an open-source command-line tool to give stylistic feedback to
writers of content.  The intention of these style rules is to help
writers write using language that's more readable and accessible.

## This tool

This is a containerized tool run from the command-line that includes
Vale and a variety of style rules that tests prose.

This image is based on the work of Joseph Kato
([GitHub.com/jdkato][GitHub.com/jdkato]), the original creator of Vale.
The [base image][base image] is available on [DockerHub][DockerHub].

### CI/CD scanning

[LanguageTool Action][LanguageTool Action] or [vale-linter][vale-linter]
may be more appropriate for scanning as a part of a CI/CD system.
This action already includes the scaffolding to surface the scan results
more cleanly, such as PR (Pull Request) comments.

## Building

```sh
docker build \
  --tag JubilantComputingMachine:latest \
  .
```

## Running

```sh
docker run \
  --interactive \
  --rm \
  --tty \
  --user "$(id --user)" \
  --volume "${PWD}:${PWD}" \
  --volume "${HOME}/.valestyles:/styles" \
  --workdir "${PWD}" \
  JubilantComputingMachine
```

* [PlainLanguage.gov]: https://plainlanguage.gov
* [style rules]: https://github.com/testthedocs/PlainLanguage
* [ChrisChinchilla.com]: https://chrischinchilla.com/
* [GitHub.com/ChrisChincilla]: https://github.com/ChrisChinchilla/
* [JDKato.io]: https://jdkato.io/
* [GitHub.com/jdkato]: https://github.com/jdkato
* [LanguageTool Action]: https://github.com/marketplace/actions/run-languagetool-with-reviewdog
* [vale-linter]: https://github.com/marketplace/actions/vale-linter
* [Vale]: https://vale.sh/
* [base image]: https://hub.docker.com/r/jdkato/vale
* [Docker Hub]: https://hub.docker.com/
