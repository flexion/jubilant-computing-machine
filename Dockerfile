FROM jdkato/vale


RUN apk --no-cache add git asciidoctor docbook2x libxslt py3-docutils
RUN mkdir -p /styles

ENTRYPOINT ["/entrypoint.sh"]

COPY entrypoint.sh /entrypoint.sh
COPY vale.ini /vale.ini
