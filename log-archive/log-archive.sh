#!/bin/bash

log_new_directory=$1
log_directory="/var/log"

if [ ! -d "$log_new_directory" ]; then
	echo "Error: The parameter isn't a directory"
	exit 1
fi

file_name="log_archive_$(date -u +%Y%m%d_%H%M%S).tar.gz"

tar -czf "$log_new_directory$file_name" $log_directory

