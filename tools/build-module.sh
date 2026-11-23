#!/bin/bash
# Builds the PineappleTAK module package: PineappleTAK-<version>.tar.gz
# Needs Node.js and npm. Run from the repository root:  tools/build-module.sh
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MOD="$ROOT/module/PineappleTAK"
SRC="$MOD/projects/PineappleTAK/src"

# the service goes inside the module (assets/pineappletak), without caches or your data
rm -rf "$SRC/assets/pineappletak"
mkdir -p "$SRC/assets"
cp -a "$ROOT/pineappletak" "$SRC/assets/pineappletak"
find "$SRC/assets/pineappletak" \( -name __pycache__ -o -name '*.pyc' \) -prune -exec rm -rf {} +
rm -f "$SRC/assets/pineappletak/core/certs/"*.pem "$SRC/assets/pineappletak/core/certs/"*.p12 "$SRC/assets/pineappletak/core/web/auth"

cd "$MOD"
[ -d node_modules ] || npm install --no-audit --no-fund --loglevel=error
# Angular 9 on a current Node.js needs the legacy OpenSSL provider
export NODE_OPTIONS="${NODE_OPTIONS:---openssl-legacy-provider}"
PATH="$MOD/node_modules/.bin:$PATH" bash ./build.sh package
rm -rf "$SRC/assets/pineappletak"
mv "$MOD"/PineappleTAK-*.tar.gz "$ROOT/"
ls -l "$ROOT"/PineappleTAK-*.tar.gz
