#!/usr/bin/env bash
# Verifies that apps/dashboard/build/web can be served from /flutter-kit/.
set -u
dir="apps/dashboard/build/web"
fail=0
for f in index.html 404.html main.dart.wasm; do
  [ -f "$dir/$f" ] || { echo "missing $dir/$f"; fail=1; }
done
if [ -f "$dir/index.html" ] && ! grep -q '<base href="/flutter-kit/">' "$dir/index.html"; then
  echo "index.html has wrong <base href>"; fail=1
fi
[ "$fail" = 0 ] && echo "check_build OK"
exit "$fail"
