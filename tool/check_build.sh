#!/usr/bin/env bash
# Verifies that apps/dashboard/build/web can be served from /flutter-kit/.
set -u
cd "$(dirname "$0")/.."
dir="apps/dashboard/build/web"
fail=0
for f in index.html 404.html main.dart.wasm; do
  [ -f "$dir/$f" ] || { echo "missing $dir/$f"; fail=1; }
done
for f in index.html 404.html; do
  if [ -f "$dir/$f" ] && ! grep -q '<base href="/flutter-kit/">' "$dir/$f"; then
    echo "$f has wrong <base href>"; fail=1
  fi
done
[ "$fail" = 0 ] && echo "check_build OK"
exit "$fail"
