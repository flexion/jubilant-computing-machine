FROM docker.io/jdkato/vale:v2.22.0

ENV RUNNER="runner"

COPY apk.txt /

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

RUN tr '\n' '\0' < apk.txt | xargs -0 apk add --no-cache  \
  && ( getent passwd "${RUNNER}" || adduser -D "${RUNNER}" ) \
  && mkdir -p /PlainLanguage \
  && wget -q https://github.com/testthedocs/PlainLanguage/archive/refs/heads/master.zip -O /PlainLanguage/master.zip \
  && unzip -j -d /PlainLanguage /PlainLanguage/master.zip \
  && rm -f /PlainLanguage/master.zip \
  && zip /PlainLanguage.zip /PlainLanguage

ENTRYPOINT ["/entrypoint.sh"]
USER "${RUNNER}"
HEALTHCHECK NONE

COPY entrypoint.sh /entrypoint.sh
COPY vale.ini /vale.ini
