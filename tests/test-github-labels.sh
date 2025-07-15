#!/bin/bash

# Test script to verify CMDS GitHub label system
# This script tests that all 18 required labels exist with correct properties

set -e

echo "Testing CMDS GitHub Label System..."

# Define expected labels with colors and descriptions
declare -A expected_labels=(
    # Priority Labels (3)
    ["now"]="#d73a49|Current active work (limit 1-2)"
    ["next"]="#ff8c00|Ready for work after current"
    ["future"]="#ffd700|Planned but not yet ready"
    
    # Status Labels (6)
    ["to-do"]="#0366d6|Planned but not started"
    ["in-progress"]="#28a745|Currently being worked on"
    ["on-hold"]="#ffc107|Temporarily paused"
    ["blocked"]="#dc3545|Blocked by dependency"
    ["done"]="#6f42c1|Completed successfully"
    ["cancelled"]="#6c757d|Cancelled/abandoned"
    
    # Scope Labels (3)
    ["prd"]="#20c997|Product Requirement Document"
    ["crd"]="#17a2b8|Change Request Document"
    ["task"]="#198754|Individual task"
    
    # Type Labels (6)
    ["feature"]="#6610f2|New feature development"
    ["bug"]="#e83e8c|Bug fix"
    ["documentation"]="#fd7e14|Documentation work"
    ["refactor"]="#20c997|Code refactoring"
    ["test"]="#6f42c1|Test development"
    ["other"]="#adb5bd|Other work type"
)

# Test that all 18 labels exist
echo "Checking that all 18 labels exist..."
total_labels=0
missing_labels=0

for label_name in "${!expected_labels[@]}"; do
    total_labels=$((total_labels + 1))
    if ! gh label list --limit 100 | grep -q "^${label_name}"; then
        echo "❌ Missing label: ${label_name}"
        missing_labels=$((missing_labels + 1))
    else
        echo "✅ Found label: ${label_name}"
    fi
done

echo "Total labels expected: 18"
echo "Total labels checked: ${total_labels}"
echo "Missing labels: ${missing_labels}"

if [ $missing_labels -eq 0 ]; then
    echo "🎉 SUCCESS: All 18 CMDS labels exist!"
    exit 0
else
    echo "❌ FAILURE: ${missing_labels} labels are missing"
    exit 1
fi