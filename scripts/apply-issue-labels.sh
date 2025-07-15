#!/bin/bash

# Apply CMDS labels to existing GitHub issues #1-6
# Follows single piece flow rules and proper categorization

set -e

echo "Applying CMDS labels to existing issues..."

# Issue #1: [PRD] CMDS Project Foundation Setup (completed)
echo "Labeling Issue #1..."
gh issue edit 1 --add-label "prd,feature,done"

# Issue #2: [CRD] User can access complete CMDS methodology foundation (completed) 
echo "Labeling Issue #2..."
gh issue edit 2 --add-label "crd,feature,done"

# Issue #3: Initialize session context files with real project information (completed)
echo "Labeling Issue #3..."
gh issue edit 3 --add-label "task,feature,done"

# Issue #4: [CRD] Kick mode should handle git/GitHub repository setup (ready for work)
echo "Labeling Issue #4..."
gh issue edit 4 --add-label "crd,feature,to-do,next"

# Issue #5: [CRD] Session context files need team-safe approach (ready for work)
echo "Labeling Issue #5..."
gh issue edit 5 --add-label "crd,feature,to-do,next"

# Issue #6: [CRD] User can properly categorize and track GitHub issues with CMDS labels (in progress)
echo "Labeling Issue #6..."
gh issue edit 6 --add-label "crd,feature,in-progress,now"

echo "✅ All issues #1-6 have been labeled according to CMDS workflow!"
echo "📋 Applied Priority, Status, Scope, and Type labels following single piece flow rules"