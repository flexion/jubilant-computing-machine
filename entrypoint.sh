#!/bin/sh

if [ -f ".vale.ini" ] ; then
  config=".vale.ini"
else
  config="/vale.ini"
fi

/bin/vale --config="${config}" "$@"
