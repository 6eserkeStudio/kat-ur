#!/bin/bash
set -e
PKG_NAME="my-app"
PKG_VERSION="1.0.0"
PKG_ARCH="x86_64"
PKG_DESC="My awesome application"
PKG_DEPS="libcurl,openssl"

# === BUILD INSTRUCTIONS (edit this section) ===
# Compile your app here. Example:
# git clone https://github.com/you/my-app.git
# cd my-app && make
# cp my-app ../

# === DO NOT CHANGE BELOW THIS LINE ===
mkdir -p files/usr/bin
# cp <your-compiled-binary> files/usr/bin/$PKG_NAME  # uncomment and edit

DEPS_JSON=$(echo "$PKG_DEPS" | tr ',' '\n' | sed 's/^/"/;s/$/"/' | paste -sd, | sed 's/^/[/;s/$/]/')
cat > files/metadata.json << EOF
{ "name": "$PKG_NAME", "version": "$PKG_VERSION", "description": "$PKG_DESC", "dependencies": $DEPS_JSON, "arch": "$PKG_ARCH", "files": ["usr/bin/$PKG_NAME"], "install_script": false }
EOF
tar czf ${PKG_NAME}-${PKG_VERSION}-${PKG_ARCH}.kat -C files .
echo "Built: ${PKG_NAME}-${PKG_VERSION}-${PKG_ARCH}.kat"
