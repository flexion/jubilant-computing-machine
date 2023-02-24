FROM jdkato/vale


RUN apk update && apk add git
RUN mkdir -p /styles /docs ; git clone https://github.com/testthedocs/PlainLanguage.git /styles

WORKDIR /docs

ENTRYPOINT /entrypoint.sh

COPY entrypoint.sh /entrypoint.sh
COPY vale.ini /vale.ini

CMD .
