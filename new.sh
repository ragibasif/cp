#!/bin/bash

set -vx

# Usage: ./new.sh [platform] [problem_id] [difficulty/contest] [problem_name] [language]

PLATFORM=$1        # e.g., "codeforces", "leetcode"
PROBLEM_ID=$2      # e.g., "1823A", "two_sum"
CONTEST_OR_DIFF=$3 # e.g., "1800-1999" (CF) or "easy" (LeetCode)
PROBLEM_NAME=$4    # e.g., "A-characteristic" (optional)
LANGUAGE=$5        # e.g., "py" or "cpp" (programming language)

# Define paths
PLATFORM_DIR="./${PLATFORM}"
CATEGORY_DIR="${PLATFORM_DIR}/${CONTEST_OR_DIFF}"
FILE_PATH="${CATEGORY_DIR}/${PROBLEM_ID}_${PROBLEM_NAME}.${LANGUAGE}"

# Create directory if it doesn't exist
mkdir -p "$CATEGORY_DIR"

# Generate file with template and metadata
cat >"$FILE_PATH" <<EOF
/*
Problem: ${PROBLEM_ID} ${PROBLEM_NAME}
Platform: ${PLATFORM}
Contest/Difficulty: ${CONTEST_OR_DIFF}
URL: TODO_ADD_URL
Memory Limit: TODO_MB
Time Limit: TODO_ms
*/
EOF

echo "Created: ${FILE_PATH}"
