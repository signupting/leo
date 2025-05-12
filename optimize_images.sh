#!/bin/bash

# Simple script to optimize images for the $LEO website
# Creates backups before optimization

# Create backup directory
mkdir -p original_images

# Function to optimize a PNG file
optimize_png() {
  local file=$1
  echo "Optimizing PNG: $file"
  cp "$file" "original_images/$(basename "$file")"
  
  # Use sips (built-in macOS tool) for basic compression
  sips -s format png -s formatOptions medium "$file" --out "$file.tmp"
  mv "$file.tmp" "$file"
  
  echo "✅ Done: $file ($(du -h "$file" | cut -f1) vs. $(du -h "original_images/$(basename "$file")" | cut -f1))"
}

# Function to optimize a JPG file
optimize_jpg() {
  local file=$1
  echo "Optimizing JPG: $file"
  cp "$file" "original_images/$(basename "$file")"
  
  # Use sips (built-in macOS tool) for compression
  sips -s format jpeg -s formatOptions 75 "$file" --out "$file.tmp"
  mv "$file.tmp" "$file"
  
  echo "✅ Done: $file ($(du -h "$file" | cut -f1) vs. $(du -h "original_images/$(basename "$file")" | cut -f1))"
}

# Optimize each image type individually
echo "=== Starting image optimization ==="

# === LARGEST PNG FILES FIRST ===
optimize_png "bg2.png"
optimize_png "how-to-buy-button.png"
optimize_png "memes/meme-9.png"
optimize_png "memes/meme-8.png"
optimize_png "memes-button.png"
optimize_png "memes/meme-7.png"
optimize_png "leo-army-button.png"
optimize_png "hero-img.png"
optimize_png "twitter-button.png"
optimize_png "about-button.png"
optimize_png "telegram-button.png"
optimize_png "eth.png"
optimize_png "lambo.png"
optimize_png "meme-button.png"
optimize_png "page2.png"

# === JPG FILES ===
optimize_jpg "bg.jpg"
optimize_jpg "bgpage4.jpg"
optimize_jpg "bg1.jpg"
optimize_jpg "page2-bg.jpg"
optimize_jpg "bg4.jpg"
optimize_jpg "bg3.jpg"
optimize_jpg "memes/meme-1.jpeg"
optimize_jpg "memes/meme-5.jpg"
optimize_jpg "memes/meme-2.jpg"
optimize_jpg "memes/meme-6.jpg"
optimize_jpg "memes/meme-4.jpg"
optimize_jpg "memes/meme-3.jpg"
optimize_jpg "leo-thumbnail.jpg"

echo "=== Image optimization complete! ==="
echo "Original images are backed up in ./original_images/"
