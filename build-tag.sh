#!/usr/bin/env bash

git tag $(grep ^yt-dlp requirements.txt | awk -F'==' '{print $2}')
