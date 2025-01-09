#!/bin/bash

# Function to generate a random string for file content
generate_random_string() {
    tr -dc 'A-Za-z0-9' </dev/urandom | head -c 8
}

# Infinite loop for committing and pushing
while true; do
    # Generate a random string
    random_string=$(generate_random_string)

    # Generate a random file name
    random_file="file_$random_string.txt"

    # Create a new file with random content
    echo "$random_string" > "$random_file"

    # Add the file to staging
    git add "$random_file"

    # Commit the changes with a random message
    git commit -m "Add $random_file with random content"

    # Push the commit to the repository
    git push origin main

    # Wait for a random interval between 5 to 10 seconds
    sleep $((RANDOM % 6 + 5))
done
