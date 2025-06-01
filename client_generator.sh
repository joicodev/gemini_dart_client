#!/bin/bash

# CONFIGURATION
SWAGGER_URL="http://localhost:3000/api-json"
OUTPUT_DIR="."
GENERATOR="dart-dio"
PACKAGE_NAME="orion_gem_dart_client"
DEFAULT_VERSION="1.0.0"
INCREMENT_PART="patch"  # or: major / minor / patch

# Function to increment SemVer
increment_version() {
  local version=$1
  local part=$2
  IFS='.' read -r major minor patch <<< "$version"
  
  case $part in
    major)
      ((major++))
      minor=0
      patch=0
      ;;
    minor)
      ((minor++))
      patch=0
      ;;
    patch|*)
      ((patch++))
      ;;
  esac

  echo "$major.$minor.$patch"
}

# Get current version
if [ -f "pubspec.yaml" ]; then
  CURRENT_VERSION=$(grep '^version:' pubspec.yaml | cut -d ' ' -f2)
  NEW_VERSION=$(increment_version "$CURRENT_VERSION" "$INCREMENT_PART")
  echo "🔁 Incrementing version: $CURRENT_VERSION → $NEW_VERSION"
else
  echo "🆕 Creating new pubspec.yaml with default version: $DEFAULT_VERSION"
  CURRENT_VERSION=$DEFAULT_VERSION
  NEW_VERSION=$(increment_version "$DEFAULT_VERSION" "$INCREMENT_PART")
fi

# Clean previous SDK files
echo "🧹 Cleaning previous SDK files..."
rm -rf ./lib ./doc ./test .openapi-generator .openapi-generator-ignore

# Generate SDK
echo "🚀 Generating Dart SDK: $PACKAGE_NAME@$NEW_VERSION"
openapi-generator-cli generate \
  -g $GENERATOR \
  -i $SWAGGER_URL \
  -o $OUTPUT_DIR \
  --additional-properties=pubName=$PACKAGE_NAME,pubVersion=$NEW_VERSION,serializationLibrary=built_value,buildRunner=true,useEnumExtension=true

# Update version in pubspec.yaml
if [ -f "pubspec.yaml" ]; then
  sed -i '' "s/^version: .*/version: $NEW_VERSION/" pubspec.yaml
else
  echo "name: $PACKAGE_NAME" > pubspec.yaml
  echo "version: $NEW_VERSION" >> pubspec.yaml
  echo "description: Auto-generated SDK" >> pubspec.yaml
  echo "environment:" >> pubspec.yaml
  echo "  sdk: '>=2.18.0 <4.0.0'" >> pubspec.yaml
fi

# Install dependencies and generate .g.dart
echo "📦 Running build_runner to generate .g.dart files..."
dart pub get
dart run build_runner build --delete-conflicting-outputs

echo "✅ SDK and .g.dart files generated successfully with version $NEW_VERSION"
