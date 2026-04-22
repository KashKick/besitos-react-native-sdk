#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
EXAMPLE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SDK_DIR="$(cd "$EXAMPLE_DIR/.." && pwd)"

echo "📦 Packing SDK from $SDK_DIR..."
cd "$SDK_DIR"
TARBALL=$(npm pack --pack-destination "$EXAMPLE_DIR" 2>/dev/null | tail -1)
echo "✅ Created $TARBALL"

cd "$EXAMPLE_DIR"

cp package.json package.json.bak

node -e "
const pkg = require('./package.json');
pkg.dependencies['react-native-besitos-offerwall'] = 'file:./$TARBALL';
require('fs').writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
"
echo "✅ Updated package.json to use packed tarball"

npm install

echo "🚀 Starting EAS build..."
PROFILE=${1:-preview}
npx eas build --platform android --local --profile "$PROFILE"

echo "🧹 Cleaning up..."
mv package.json.bak package.json
rm -f "$TARBALL"
npm install

echo "✅ Build complete!"
