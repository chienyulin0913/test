#!/bin/bash

FILE=$1

# List of available datasets
AVAILABLE_DATASETS=("Boston" "tiles2")

# Check if the specified dataset is available
if [[ ! " ${AVAILABLE_DATASETS[@]} " =~ " ${FILE} " ]]; then
  echo "Available datasets are Boston, tiles2"
  exit 1
fi

echo "Specified [$FILE]"

# Path map (add your local paths here)
declare -A FILE_PATH_MAP
FILE_PATH_MAP["Boston"]="/path/to/local/Boston.tar.gz"
FILE_PATH_MAP["tiles2"]="/path/to/local/tiles2.tar.gz"

# Get the file path for the specified dataset
FILE_PATH=${FILE_PATH_MAP[$FILE]}

TAR_FILE=./datasets/$FILE.tar.gz
TARGET_DIR=./datasets/$FILE/

# Copy the .tar.gz file from local path to the current directory
cp $FILE_PATH $TAR_FILE

# Create the target directory if it does not exist
mkdir -p $TARGET_DIR

# Extract the .tar.gz file
tar -zxvf $TAR_FILE -C ./datasets/

# Remove the .tar.gz file after extraction
rm $TAR_FILE

echo "Dataset [$FILE] has been copied and extracted to $TARGET_DIR"
