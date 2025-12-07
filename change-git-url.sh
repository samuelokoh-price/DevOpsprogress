#!/bin/bash
# Safe Repo URL Update Script
# Old URL: https://github.com/samuelokoh-price/End-to-End-Devops-pipeline-project.git
# New URL: https://github.com/samuelokoh-price/End-to-End-Devops-pipeline-project.git

OLD_URL="https://github.com/samuelokoh-price/End-to-End-Devops-pipeline-project.git"
NEW_URL="https://github.com/samuelokoh-price/End-to-End-Devops-pipeline-project.git"

OLD_NAME="End-to-End-Devops-pipeline-project"
NEW_NAME="End-to-End-Devops-pipeline-project"

# 1. Update remote origin in local repo
echo "Updating git remote origin..."
git remote set-url origin "$NEW_URL"

# 2. Search and replace in all files
echo "Searching and replacing old repo references..."
grep -rl "$OLD_URL" . | xargs sed -i "s|$OLD_URL|$NEW_URL|g"
grep -rl "$OLD_NAME" . | xargs sed -i "s|$OLD_NAME|$NEW_NAME|g"

# 3. Verify changes
echo "Verifying remote URL..."
git remote -v

echo "✅ Repo URL update complete. Please test your pipelines and deployments."
