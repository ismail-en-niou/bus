#!/bin/bash

# Step 1: Set the correct locale for UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Step 2: Ensure we're on the correct branch (master or main)
current_branch=$(git symbolic-ref --short HEAD)

# Check if the branch is 'master' or 'main', and push accordingly
if [[ "$current_branch" == "master" ]]; then
    branch_to_push="master"
elif [[ "$current_branch" == "main" ]]; then
    branch_to_push="main"
else
    echo "Error: You're on an unexpected branch ($current_branch). Please switch to master or main."
    exit 1
fi

# Step 3: Create a random file with random content to ensure changes
random_string=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 8)
random_file="file_$random_string.txt"
echo "$random_string" > "$random_file"

# Step 4: Add, commit, and push changes
git add .  # Stage changes
git commit -m "Add $random_file with random content"  # Commit with the file name

# Step 5: Push changes to the remote branch
git push origin "$branch_to_push"

# Check if the push was successful
if [ $? -eq 0 ]; then
    echo "Changes successfully pushed to $branch_to_push."
else
    echo "Error: Failed to push changes. Please check for issues."
    exit 1
fi
