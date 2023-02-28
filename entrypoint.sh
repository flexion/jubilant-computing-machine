#!/bin/sh

if [ -f ".vale.ini" ] ; then
  config=".vale.ini"
else
  printf "[note] using default configuration\n" 1>&2
  config="/vale.ini"
fi

if [ -z "$1" ] ; then
  /bin/vale --config="${config}" .
else
  /bin/vale --config="${config}" "$@"
fi
