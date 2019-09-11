#!/bin/bash
if [ ! -z "$BLOCK_BUTTON" ]; then
    $1
    $2
else
    $1
fi
