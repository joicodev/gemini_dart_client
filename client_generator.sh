#!/bin/bash

# CONFIGURATION
SWAGGER_URL="http://localhost:3000/api-json"
OUTPUT_DIR="."  # Current directory
GENERATOR="dart-dio"
PACKAGE_NAME="orion_gem_dart_client"
DEFAULT_VERSION="1.0.0"

# 🔍 Extract version from pubspec.yaml if exists
if [ -f "pubspec.yaml" ]; then
  SDK_VERSION=$(grep '^version:' pubspec.yaml | cut -d ' ' -f2)
  echo "📦 Detected existing version: $SDK_VERSION"
else
  SDK_VERSION=$DEFAULT_VERSION
  echo "📦 No pubspec.yaml found. Using default version: $SDK_VERSION"
fi

# ✅ Ensure openapi-generator-cli is installed
if ! command -v openapi-generator-cli &> /dev/null; then
    echo "Installing openapi-generator-cli..."
    npm install @openapitools/openapi-generator-cli -g
fi

# 🧹 Clean previous SDK files
echo "🧹 Cleaning previous SDK files..."
rm -rf ./lib ./doc ./test pubspec.yaml .openapi-generator .openapi-generator-ignore

# 🚀 Generate SDK
echo "🚀 Generating Dart SDK: $PACKAGE_NAME@$SDK_VERSION"
openapi-generator-cli generate \
  -g $GENERATOR \
  -i $SWAGGER_URL \
  -o $OUTPUT_DIR \
  --additional-properties=pubName=$PACKAGE_NAME,pubVersion=$SDK_VERSION,serializationLibrary=built_value,buildRunner=true,useEnumExtension=true

echo "✅ SDK generated successfully at version $SDK_VERSION"
