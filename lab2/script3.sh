#!/bin/bash

ps aux | tail -1 | tr -s " " " " | cut -d " " -f2
