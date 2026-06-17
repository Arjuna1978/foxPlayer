#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🚀 Starting Expo/React Native boilerplate cleanup..."

# 1. Clean up root-level unnecessary markdown/text files
echo "📁 Cleaning up root directory files..."
FILES_TO_REMOVE=(
    "AGENTS.md"
    "CLAUDE.md"
    "files.txt"
    "LICENSE"
)

for file in "${FILES_TO_REMOVE[@]}"; do
    if [ -f "$file" ]; then
        rm "$file"
        echo "  ❌ Removed: $file"
    else
        echo "  ℹ️  Skipped (not found): $file"
    fi
done

# 2. Clean up boilerplate template assets
echo "🖼️  Cleaning up boilerplate placeholder images..."

# Remove specific template images but preserve app branding shell files
ASSETS_TO_REMOVE=(
    "assets/images/react-logo.png"
    "assets/images/react-logo@2x.png"
    "assets/images/react-logo@3x.png"
    "assets/images/tutorial-web.png"
    "assets/images/logo-glow.png"
    "assets/images/expo-badge.png"
)

for asset in "${ASSETS_TO_REMOVE[@]}"; do
    if [ -f "$asset" ]; then
        rm "$asset"
        echo "  ❌ Removed asset: $asset"
    fi
done

# Remove the default tabIcons directory if you intend to use vector icons
if [ -d "assets/images/tabIcons" ]; then
    rm -rf "assets/images/tabIcons"
    echo "  ❌ Removed directory: assets/images/tabIcons"
fi

# 3. Clean up boilerplate components if they exist
echo "⚛️  Checking for default boilerplate components..."
COMPONENTS_TO_REMOVE=(
    "src/components/HelloWave.tsx"
    "src/components/Collapsible.tsx"
    "src/components/ThemedText.tsx"
    "src/components/ThemedView.tsx"
)

for component in "${COMPONENTS_TO_REMOVE[@]}"; do
    if [ -f "$component" ]; then
        rm "$component"
        echo "  ❌ Removed template component: $component"
    fi
done

echo "✅ Cleanup complete! Your workspace is now lean."
echo "⚠️  Note: Remember to remove any unused imports or references to these deleted components in your root layout or index files before running 'npm start'."