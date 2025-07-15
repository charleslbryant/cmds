#!/bin/bash

# Test script to verify CMDS issues are properly labeled
# This script tests that issues #1-6 have correct Priority, Status, Scope, and Type labels

set -e

echo "Testing CMDS Issue Labeling..."

# Define expected labels for issues #1-6 based on their type and status
# Following single piece flow rules: completed items marked "done", active work marked "now"
declare -A expected_issue_labels=(
    # Issue #1: [PRD] CMDS Project Foundation Setup (completed)
    ["1"]="prd feature done"
    
    # Issue #2: [CRD] User can access complete CMDS methodology foundation (completed)
    ["2"]="crd feature done"
    
    # Issue #3: Initialize session context files with real project information (completed)
    ["3"]="task feature done"
    
    # Issue #4: [CRD] Kick mode should handle git/GitHub repository setup (ready for work)
    ["4"]="crd feature to-do next"
    
    # Issue #5: [CRD] Session context files need team-safe approach (ready for work)
    ["5"]="crd feature to-do next"
    
    # Issue #6: [CRD] User can properly categorize and track GitHub issues with CMDS labels (in progress)
    ["6"]="crd feature in-progress now"
)

# Test that all issues have correct labels
echo "Checking that issues #1-6 have proper CMDS labels..."
total_issues=0
incorrectly_labeled_issues=0

for issue_number in "${!expected_issue_labels[@]}"; do
    total_issues=$((total_issues + 1))
    expected_labels="${expected_issue_labels[$issue_number]}"
    
    echo "Checking issue #${issue_number}..."
    issue_labels=$(gh issue view ${issue_number} --json labels --jq '.labels[].name' | tr '\n' ' ' | xargs)
    
    # Check each expected label
    missing_labels=""
    for expected_label in $expected_labels; do
        if [[ ! " $issue_labels " =~ " $expected_label " ]]; then
            missing_labels="$missing_labels $expected_label"
        fi
    done
    
    if [ -n "$missing_labels" ]; then
        echo "❌ Issue #${issue_number} missing labels:$missing_labels"
        echo "   Current labels: $issue_labels"
        incorrectly_labeled_issues=$((incorrectly_labeled_issues + 1))
    else
        echo "✅ Issue #${issue_number} properly labeled"
    fi
done

echo "Total issues checked: ${total_issues}"
echo "Incorrectly labeled issues: ${incorrectly_labeled_issues}"

if [ $incorrectly_labeled_issues -eq 0 ]; then
    echo "🎉 SUCCESS: All issues #1-6 are properly labeled!"
    exit 0
else
    echo "❌ FAILURE: ${incorrectly_labeled_issues} issues need proper labeling"
    exit 1
fi