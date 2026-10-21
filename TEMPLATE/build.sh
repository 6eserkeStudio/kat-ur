#!/bin/bash
set -e

PKG_NAME="my-app"
PKG_VERSION="1.0.0"
PKG_ARCH="x86_64"
PKG_DESC="My awesome application"
PKG_DEPS="libcurl,openssl"
PKG_SOURCE="https://github.com/you/my-app.git"

# === GET YOUR APP — PICK ONE OPTION, DELETE THE OTHERS ===

# Option A: Source code in src/ folder
# cp -r src /tmp/build-src
# cd /tmp/build-src && make

# Option B: Clone from git
# git clone "$PKG_SOURCE" /tmp/build-src
# cd /tmp/build-src && make

# Option C: Pre-compiled binary in bin/ folder
# No compiling needed. Your binary goes in packages/my-app/bin/my-app

# === IF YOU USED OPTION A OR B, COMPILE HERE ===
# cd /tmp/build-src
# make

# === POINT TO YOUR BINARY ===
# Option A/B: BINARY=/tmp/build-src/my-app
# Option C:   BINARY=bin/my-app
BINARY=bin/my-app

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
