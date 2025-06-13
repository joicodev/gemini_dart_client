#!/bin/bash

# --- CONFIGURATION ---
# The URL of your OpenAPI/Swagger specification JSON.
SWAGGER_URL="http://localhost:3000/api-json"
# The output directory for the generated client.
OUTPUT_DIR="."
# The generator to use.
GENERATOR="dart-dio"
# The name of the package as it will appear in pubspec.yaml.
PACKAGE_NAME="orion_gem_nest_dart_client"
# The version to use if no pubspec.yaml is found.
DEFAULT_VERSION="1.0.0"
# The part of the version to increment: major, minor, or patch.
INCREMENT_PART="patch"

# --- SCRIPT ---

# Exit immediately if a command exits with a non-zero status.
set -e
# Treat unset variables as an error.
set -u
# Pipes will fail if any command in the pipe fails.
set -o pipefail

# --- HELPER FUNCTIONS ---

# Checks if a command exists on the system.
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Increments a semantic version string.
# Usage: increment_version "1.2.3" "patch"
increment_version() {
  local version=$1
  local part=$2
  # Read major, minor, and patch numbers into separate variables.
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

# --- MAIN LOGIC ---

# 1. Check for required command-line tools.
for cmd in openapi-generator-cli dart curl; do
  if ! command_exists "$cmd"; then
    echo "❌ Error: Required command '$cmd' is not installed or not in your PATH."
    exit 1
  fi
done

# 2. Determine the new version number.
PUBSPEC_FILE="pubspec.yaml"
if [ -f "$PUBSPEC_FILE" ]; then
  # Robustly find the version, ignoring comments and whitespace.
  CURRENT_VERSION=$(grep '^version:' "$PUBSPEC_FILE" | awk '{print $2}')
  NEW_VERSION=$(increment_version "$CURRENT_VERSION" "$INCREMENT_PART")
  echo "🔁 Incrementing version: $CURRENT_VERSION → $NEW_VERSION"
else
  NEW_VERSION=$(increment_version "$DEFAULT_VERSION" "$INCREMENT_PART")
  echo "🆕 No pubspec.yaml found. Starting with new version: $NEW_VERSION"
fi

# 3. Clean previous SDK files before generation.
echo "🧹 Cleaning previous SDK files..."
# Be specific about what is being removed to avoid accidental deletion.
rm -rf ./lib ./doc ./test ./.openapi-generator ./.openapi-generator-ignore

# 4. Fetch the OpenAPI spec to a temporary file for reliability.
SPEC_TEMP_FILE=$(mktemp)
echo "🌐 Fetching API specification from $SWAGGER_URL..."
if ! curl -fsSL "$SWAGGER_URL" -o "$SPEC_TEMP_FILE"; then
  echo "❌ Error: Failed to download the API specification from $SWAGGER_URL."
  rm "$SPEC_TEMP_FILE"
  exit 1
fi

# 5. Generate the Dart SDK using the local spec file.
echo "🚀 Generating Dart SDK: $PACKAGE_NAME@$NEW_VERSION"
openapi-generator-cli generate \
  -g "$GENERATOR" \
  -i "$SPEC_TEMP_FILE" \
  -o "$OUTPUT_DIR" \
  --additional-properties=pubName="$PACKAGE_NAME",pubVersion="$NEW_VERSION",serializationLibrary=built_value,buildRunner=true,useEnumExtension=true

# Clean up the temporary spec file.
rm "$SPEC_TEMP_FILE"

# 6. Install dependencies and generate model files.
echo "📦 Running 'dart pub get'..."
dart pub get

echo "🔨 Running 'build_runner' to generate files..."
dart run build_runner build --delete-conflicting-outputs

echo "✅ SDK and required files generated successfully with version $NEW_VERSION."

