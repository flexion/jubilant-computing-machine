FROM jdkato/vale:v2.22.0

RUN \
  apk --no-cache add \
    asciidoctor=2.0.18-r0 \
    docbook2x=0.8.8-r8 \
    libxslt=1.1.37-r0 \
    py3-docutils=0.19-r1

ENTRYPOINT ["/entrypoint.sh"]

COPY entrypoint.sh /entrypoint.sh
COPY vale.ini /vale.ini
