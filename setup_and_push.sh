#!/data/data/com.termux/files/usr/bin/bash

# CONFIGURATION
ZIP_PATH="/storage/emulated/0/Download/Merged_X-strike.zip"
PROJECT_NAME="Merged_X-strike"
GITHUB_REPO="git@github.com:1mgarstone/Merged_X-strike.git"
TARGET_DIR=~/storage/downloads/$PROJECT_NAME

# BEGIN
echo "[✓] Setting up Termux storage..."
termux-setup-storage

echo "[✓] Creating and extracting project..."
mkdir -p "$TARGET_DIR"
unzip -o "$ZIP_PATH" -d "$TARGET_DIR"

cd "$TARGET_DIR" || { echo "[✗] Failed to enter $TARGET_DIR"; exit 1; }

echo "[✓] Trusting directory ownership for Git..."
git config --global --add safe.directory "$TARGET_DIR"

echo "[✓] Initializing Git repository..."
git init
git remote add origin "$GITHUB_REPO"

echo "[✓] Staging files..."
git add .

echo "[✓] Committing with GPG signature..."
git commit -S -m "Initial push of Merged_X-strike arbitrage system"

echo "[✓] Setting main branch..."
git branch -M main

echo "[✓] Pushing to GitHub..."
git push -u origin main

echo "[✅] Completed. View repo at:"
echo "🔗 https://github.com/1mgarstone/Merged_X-strike"
