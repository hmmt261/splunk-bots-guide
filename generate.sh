#!/usr/bin/env bash
# book/main.adoc から dist/index.html を生成する。
set -eu
cd "$(dirname "$0")"

echo generating html...
bundle exec asciidoctor -o dist/index.html book/main.adoc
if [ -d book/imgs ]; then
  cp -r book/imgs dist/
fi
