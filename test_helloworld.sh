#!/bin/bash

# Unit tests for helloworld program

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

PROGRAM="./helloworld.exe"
PASSED=0
FAILED=0

# Test 1: Program should exit with status code 0 upon successful execution
test_exit_code_zero() {
    echo "Test 1: Checking exit code is 0 on successful execution..."
    
    $PROGRAM > /dev/null 2>&1
    EXIT_CODE=$?
    
    if [ $EXIT_CODE -eq 0 ]; then
        echo -e "${GREEN}✓ PASSED${NC}: Program exited with status code 0"
        ((PASSED++))
        return 0
    else
        echo -e "${RED}✗ FAILED${NC}: Program exited with status code $EXIT_CODE (expected 0)"
        ((FAILED++))
        return 1
    fi
}

# Run tests
echo "Running unit tests for helloworld program..."
echo "=============================================="

test_exit_code_zero

# Summary
echo ""
echo "=============================================="
echo "Test Summary:"
echo "  Passed: $PASSED"
echo "  Failed: $FAILED"
echo "=============================================="

# Exit with appropriate code
if [ $FAILED -eq 0 ]; then
    exit 0
else
    exit 1
fi
