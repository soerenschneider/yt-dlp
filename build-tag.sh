#!/usr/bin/env bash

grep ^yt-dlp requirements.txt | awk -F'==' '{print $2}'
