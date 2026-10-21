# How to submit a package to Katana UR

## Step 1: Create your package folder
Copy this TEMPLATE folder to `packages/<your-app-name>/`

## Step 2: Add your source code
Pick ONE option:

**Option A: Include source in the folder**
Put your source code in `packages/<your-app-name>/src/`
Delete the `source=` line in your .recipe file
Uncomment "Option A" in build.sh and delete "Option B"

**Option B: Clone from git**
Keep the `source=` line in your .recipe file with your git URL
build.sh will clone it automatically

## Step 3: Edit your .recipe file
