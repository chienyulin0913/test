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

# URL map (add your direct download links here)
declare -A URL_MAP
URL_MAP["Boston"]="1OAtnflwankcvDe7DaVNCh1KmiYXVDsyY"
URL_MAP["tiles2"]="1-ZCX-HMEgSctyPrxyXgcwvJXUd-TcACb"

# Get the file ID for the specified dataset
FILE_ID=${FILE_ID_MAP[$FILE]}

TAR_FILE=./datasets/$FILE.tar.gz
TARGET_DIR=./datasets/$FILE/

# Download the .tar.gz file using gdown
gdown --id $FILE_ID -O $TAR_FILE

# Create the target directory if it does not exist
mkdir -p $TARGET_DIR

# Extract the .tar.gz file
tar -zxvf $TAR_FILE -C ./datasets/

# Remove the .tar.gz file after extraction
rm $TAR_FILE

echo "Dataset [$FILE] has been downloaded and extracted to $TARGET_DIR"
