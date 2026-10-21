# How to submit a package to Katana UR

## Step 1: Create your package folder
Copy this TEMPLATE folder to `packages/<your-app-name>/`

## Step 2: Add your app — pick ONE option

**Option A: Source code**
Put your source code in `packages/<your-app-name>/src/`
Delete the `source=` line in your .recipe file
Uncomment Option A in build.sh, delete Options B and C

**Option B: Git clone**
Keep the `source=` line in your .recipe file with your git URL
Uncomment Option B in build.sh, delete Options A and C

**Option C: Pre-compiled binary**
Put your compiled binary in `packages/<your-app-name>/bin/`
Delete the `source=` line in your .recipe file
Uncomment Option C in build.sh, delete Options A and B

## Step 3: Edit your .recipe file
