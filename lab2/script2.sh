#!/bin/bash

grep --include=cmdline --exclude-dir=task -r "^/sbin" /proc | cut -d " " -f3 | cut -d / -f3
