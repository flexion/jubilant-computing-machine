#!/bin/sh

set -eu

if [ -f ".vale.ini" ]; then
  config=".vale.ini"
else
  printf "[note] using default configuration\n" 1>&2
  config="/vale.ini"
fi

styles_path="$(sed -Ene 's/^[[:space:]]*stylespath[[:space:]]*=[[:space:]]*//Ip' "${config}")"
vocab_path="${styles_path}/Vocab/Custom/"

if [ ! -d "${styles_path}" ]; then
  printf "[note] creating missing StylesPath '%s'\n" "${styles_path}" 1>&2
  mkdir -p "${styles_path}"
fi

if [ ! -d "${vocab_path}" ] ; then
  printf "[note] creating missing Custom Vocab path '%s'\n" "${vocab_path}" 1>&2
  mkdir -p "${vocab_path}"
fi

if [ -n "$(find "${styles_path}" -maxdepth 0 -type d -empty 2> /dev/null)" ]; then
  printf "[note] populating empty StylesPath '%s'\n" "${styles_path}" 1>&2
  /bin/vale --config="${config}" sync
fi

if [ -f ".vale.accept" ] ; then
  printf "[note] adding accept list to '%s'\n" "${vocab_path}accept.txt" 1>&2
  cp -f ".vale.accept" "${vocab_path}accept.txt"
fi

if [ -f ".vale.reject" ] ; then
  printf "[note] adding reject list to '%s'\n" "${vocab_path}reject.txt" 1>&2
  cp -f ".vale.reject" "${vocab_path}reject.txt"
fi


if [ -z "$1" ]; then
  /bin/vale --config="${config}" .
else
  /bin/vale --config="${config}" "$@"
fi
