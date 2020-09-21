#!/bin/bash

source=/etc
destination=emails.lst

touch $destination

email="\b[[:alnum:]._%+-]+@[[:alnum:].-]+\.[[:alpha:]]{2,6}\b"

grep --binary-files=text  -r -E -h -o   $email $source | tr -s "\n" "," > $destination
