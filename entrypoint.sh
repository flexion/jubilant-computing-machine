#!/bin/sh

set -eu

if [ -f ".vale.ini" ]; then
  config=".vale.ini"
else
  printf "[note] using default configuration\n" 1>&2
  config="/vale.ini"
fi

styles_path="$(sed -Ene 's/^[[:space:]]*stylespath[[:space:]]*=[[:space:]]*//Ip' "${config}")"

if [ ! -d "${styles_path}" ]; then
  printf "[note] creating missing StylesPath '%s'\n" "${styles_path}" 1>&2
  mkdir -p "${styles_path}"
fi

if [ -n "$(find "${styles_path}" -maxdepth 0 -type d -empty 2> /dev/null)" ]; then
  printf "[note] populating empty StylesPath '%s'\n" "${styles_path}" 1>&2
  /bin/vale --config="${config}" sync
fi

if [ -z "$1" ]; then
  /bin/vale --config="${config}" .
else
  /bin/vale --config="${config}" "$@"
fi
