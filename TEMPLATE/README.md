# How to submit a package to Katana UR

1. Copy this TEMPLATE folder to `packages/<your-app-name>/`
2. Edit `<your-app-name>.recipe` — fill in name, version, description, arch, dependencies
3. Edit `build.sh` — add your build commands, copy your compiled binary to `files/usr/bin/`
4. Open a Pull Request — it auto-merges and builds automatically
5. Users install with: `kur install <your-app-name>`

## Rules
- Package name must be lowercase, no spaces, hyphens allowed
- Version must be semantic (e.g. 1.0.0)
- Your build.sh MUST produce a .kat file
- The .kat file is a tar.gz containing files/ and metadata.json
- No malicious code
