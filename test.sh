#!/usr/bin/env bash
BRANCH_NAME=feature/refacto
CLEAN_BRANCH_NAME=$(echo "$BRANCH_NAME" | tr '[:upper:]' '[:lower:]')
CLEAN_BRANCH_NAME="${CLEAN_BRANCH_NAME////-}"
echo $CLEAN_BRANCH_NAME
