#!/bin/bash


tar pcf - $HOME | gzip | openssl enc -aes-256-cbc -pbkdf2 -e -in - -out  ~/backup/laptop-backup-partial-`date --rfc-3339=date`.tar.gz.openssl_aes-256-cbc
