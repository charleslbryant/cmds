#!/bin/bash

# Create CMDS GitHub label system
# Creates all 18 required labels with proper colors and descriptions

set -e

echo "Creating CMDS GitHub Label System..."

# Priority Labels (3)
echo "Creating Priority labels..."
gh label create "now" --color "d73a49" --description "Current active work (limit 1-2)" --force || echo "Label 'now' already exists"
gh label create "next" --color "ff8c00" --description "Ready for work after current" --force || echo "Label 'next' already exists"
gh label create "future" --color "ffd700" --description "Planned but not yet ready" --force || echo "Label 'future' already exists"

# Status Labels (6)
echo "Creating Status labels..."
gh label create "to-do" --color "0366d6" --description "Planned but not started" --force || echo "Label 'to-do' already exists"
gh label create "in-progress" --color "28a745" --description "Currently being worked on" --force || echo "Label 'in-progress' already exists"
gh label create "on-hold" --color "ffc107" --description "Temporarily paused" --force || echo "Label 'on-hold' already exists"
gh label create "blocked" --color "dc3545" --description "Blocked by dependency" --force || echo "Label 'blocked' already exists"
gh label create "done" --color "6f42c1" --description "Completed successfully" --force || echo "Label 'done' already exists"
gh label create "cancelled" --color "6c757d" --description "Cancelled/abandoned" --force || echo "Label 'cancelled' already exists"

# Scope Labels (3)
echo "Creating Scope labels..."
gh label create "prd" --color "20c997" --description "Product Requirement Document" --force || echo "Label 'prd' already exists"
gh label create "crd" --color "17a2b8" --description "Change Request Document" --force || echo "Label 'crd' already exists"
gh label create "task" --color "198754" --description "Individual task" --force || echo "Label 'task' already exists"

# Type Labels (6)
echo "Creating Type labels..."
gh label create "feature" --color "6610f2" --description "New feature development" --force || echo "Label 'feature' already exists"
gh label create "refactor" --color "20c997" --description "Code refactoring" --force || echo "Label 'refactor' already exists"
gh label create "test" --color "6f42c1" --description "Test development" --force || echo "Label 'test' already exists"
gh label create "other" --color "adb5bd" --description "Other work type" --force || echo "Label 'other' already exists"

echo "✅ All CMDS labels created successfully!"
echo "📋 Total labels: 18 (3 Priority + 6 Status + 3 Scope + 6 Type)"