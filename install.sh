#!/bin/bash
set -e
docker volume create reviewer_volume
docker build -t reviewer .
cp review ~/.local/bin/review && chmod +x ~/.local/bin/review

