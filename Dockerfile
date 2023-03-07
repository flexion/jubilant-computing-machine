FROM docker.io/jdkato/vale:v2.22.0

# renovate: datasource=repology depName=alpine_3_17/asciidoctor versioning=loose
ENV ASCIIDOCTOR_VERSION="2.0.18-r0"

# renovate: datasource=repology depName=alpine_3_17/doxbook2x versioning=loose
ENV DOCBOOK2X_VERISON="0.8.8-r8"

# renovate: datasource=repology depName=alpine_3_17/libxslt versioning=loose
ENV LIBXSLT_VERSION="1.1.37-r0"

# renovate: datasource=repology depName=alpine_3_17/py3-docutilss versioning=loose
ENV PY3_DOCUTILS_VERSION="0.19-r1"

ENV RUNNER="runner"

RUN \
  apk --no-cache add \
    asciidoctor="${ASCIIDOCTOR_VERSION}" \
    docbook2x="${DOCBOOK2X_VERISON}" \
    libxslt="${LIBXSLT_VERSION}" \
    py3-docutils="${PY3_DOCUTILS_VERSION}" \
  && ( getent passwd "${RUNNER}" || adduser -D "${RUNNER}" )

ENTRYPOINT ["/entrypoint.sh"]
USER "${RUNNER}"
HEALTHCHECK NONE

COPY entrypoint.sh /entrypoint.sh
COPY vale.ini /vale.ini
