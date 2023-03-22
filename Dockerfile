FROM docker.io/jdkato/vale:v2.22.0

# renovate: datasource=repology depName=alpine_3_17/asciidoctor versioning=loose
ENV ASCIIDOCTOR_VERSION="2.0.18-r0"

# renovate: datasource=repology depName=alpine_3_17/py3-docutilss versioning=loose
ENV PY3_DOCUTILS_VERSION="0.19-r1"

# renovate: datasource=repology depName=alpine_3_17/zip versioning=loose
ENV ZIP_VERSION="3.0-r10"

ENV RUNNER="runner"

RUN \
  apk --no-cache add \
    asciidoctor="${ASCIIDOCTOR_VERSION}" \
    py3-docutils="${PY3_DOCUTILS_VERSION}" \
    zip="${ZIP_VERSION}" \
  && mkdir -p /PlainLanguage \
  && wget -q https://github.com/testthedocs/PlainLanguage/archive/refs/heads/master.zip -O /PlainLanguage/master.zip \
  && unzip -j -d /PlainLanguage /PlainLanguage/master.zip \
  && rm -f /PlainLanguage/master.zip \
  && zip /PlainLanguage.zip /PlainLanguage \
  && ( getent passwd "${RUNNER}" || adduser -D "${RUNNER}" )

ENTRYPOINT ["/entrypoint.sh"]
USER "${RUNNER}"
HEALTHCHECK NONE

COPY entrypoint.sh /entrypoint.sh
COPY vale.ini /vale.ini
