#!/bin/bash

# Test script to verify kick mode git repository detection functionality
# This script tests that kick mode includes git repository status in its output

set -e

echo "Testing Kick Mode Git Repository Detection Integration..."

# Test that kick mode includes git repository status
test_kick_mode_git_integration() {
    echo "Running test: Kick mode includes git repository status"
    
    # Check if kick mode contains git repository detection logic
    if grep -q "Git Repository" /home/charleslbryant/projects/cmds/.claude/commands/kick.md; then
        echo "✅ PASS: Kick mode includes git repository status section"
        return 0
    else
        echo "❌ FAIL: Kick mode does not include git repository status section"
        return 1
    fi
}

# Test helper function for git detection logic that should be integrated
test_git_detection_logic() {
    local test_name="$1"
    local expected_status="$2"
    echo "Running test: $test_name"
    
    # This simulates the git detection logic that should be in kick mode
    if git rev-parse --git-dir >/dev/null 2>&1; then
        if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
            # Check if bare repository
            if git rev-parse --is-bare-repository >/dev/null 2>&1 && [ "$(git rev-parse --is-bare-repository)" = "true" ]; then
                repo_type="Bare"
            else
                repo_type="Normal"
            fi
            
            # Check repository state
            if git status --porcelain 2>/dev/null | grep -q .; then
                repo_state="Dirty"
            else
                repo_state="Clean"
            fi
            
            # Check repository health
            if git fsck --unreachable >/dev/null 2>&1; then
                repo_health="Healthy"
            else
                repo_health="Issues Detected"
            fi
            
            actual_status="Found"
        else
            actual_status="Not Found"
            repo_type="N/A"
            repo_state="N/A"
            repo_health="N/A"
        fi
    else
        actual_status="Not Found"
        repo_type="N/A"
        repo_state="N/A"
        repo_health="N/A"
    fi
    
    # Format output like kick mode should (for verification)
    echo "Expected kick mode output format:"
    echo "**Git Repository:**"
    echo "- Status: $actual_status"
    echo "- Type: $repo_type"
    echo "- State: $repo_state"
    echo "- Health: $repo_health"
    
    # Verify expected result
    if [ "$actual_status" = "$expected_status" ]; then
        echo "✅ PASS: $test_name (git detection logic works)"
        return 0
    else
        echo "❌ FAIL: $test_name (expected: $expected_status, got: $actual_status)"
        return 1
    fi
}

# Test 1: Integration test - Check if kick mode includes git repository status
echo ""
echo "=== Test 1: Kick Mode Integration Test ==="
test_kick_mode_git_integration
test1_result=$?

# Test 2: Git detection logic verification
echo ""
echo "=== Test 2: Git Detection Logic ==="
test_git_detection_logic "Valid git repository detection" "Found"
test2_result=$?

# Test 3: Git command availability
echo ""
echo "=== Test 3: Git Command Availability ==="
if command -v git >/dev/null 2>&1; then
    echo "✅ PASS: Git command is available"
    test3_result=0
else
    echo "❌ FAIL: Git command not found"
    test3_result=1
fi

# Summary
echo ""
echo "=== Test Summary ==="
total_tests=3
passed_tests=0

if [ $test1_result -eq 0 ]; then passed_tests=$((passed_tests + 1)); fi
if [ $test2_result -eq 0 ]; then passed_tests=$((passed_tests + 1)); fi
if [ $test3_result -eq 0 ]; then passed_tests=$((passed_tests + 1)); fi

echo "Tests passed: $passed_tests/$total_tests"

if [ $passed_tests -eq $total_tests ]; then
    echo "🎉 SUCCESS: All git detection tests passed!"
    exit 0
else
    echo "❌ FAILURE: Some tests failed"
    exit 1
fi