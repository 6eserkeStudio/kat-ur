#!/bin/bash
set -e

PKG_NAME="my-app"
PKG_VERSION="1.0.0"
PKG_ARCH="x86_64"
PKG_DESC="My awesome application"
PKG_DEPS="libcurl,openssl"
PKG_SOURCE="https://github.com/you/my-app.git"

# === GET SOURCE CODE ===
# Option A: Source is in a src/ folder next to this file
# Option B: Source is cloned from a git URL (PKG_SOURCE above)
#
# Pick ONE option and delete the other:

# Option A: Use local src/ folder
# cp -r src /tmp/build-src

# Option B: Clone from git
git clone "$PKG_SOURCE" /tmp/build-src

# === COMPILE YOUR APP ===
# Put your build commands here. Examples:
#   cd /tmp/build-src && make
#   cd /tmp/build-src && gcc main.c -o my-app
#   cd /tmp/build-src && cmake . && make
cd /tmp/build-src
make

# === FIND YOUR COMPILED BINARY ===
# Point this to wherever your compiled binary ended up
BINARY=/tmp/build-src/my-app

# === PACKAGE INTO .KAT (DO NOT CHANGE) ===
mkdir -p files/usr/bin
cp "$BINARY" "files/usr/bin/$PKG_NAME"
chmod +x "files/usr/bin/$PKG_NAME"

DEPS_JSON=$(echo "$PKG_DEPS" | tr ',' '\n' | sed 's/^/"/;s/$/"/' | paste -sd, | sed 's/^/[/;s/$/]/')
cat > files/metadata.json << EOF
{ "name": "$PKG_NAME", "version": "$PKG_VERSION", "description": "$PKG_DESC", "dependencies": $DEPS_JSON, "arch": "$PKG_ARCH", "files": ["usr/bin/$PKG_NAME"], "install_script": false }
EOF

tar czf ${PKG_NAME}-${PKG_VERSION}-${PKG_ARCH}.kat -C files .
echo "Built: ${PKG_NAME}-${PKG_VERSION}-${PKG_ARCH}.kat"
