#!/bin/bash

# MySQL Connection Set
DB_USER="root"
DB_PASS="090800"

# Backup Directory Set
TODAY=$(date +%Y%m%d)
BACKUP_PATH="$HOME/procedureBackup"
mkdir -p "$BACKUP_PATH/$TODAY"

BACKUP_FILE_PATH="$BACKUP_PATH/$TODAY"

# DATABASE LIST
DBLISTS="/root/dblist.txt"

for SCHEMANAME in $(cat "$DBLISTS"); do

	# TEST
	# echo $SCHEMANAME;
	PROCEDURE_BACKUP_FILE="$BACKUP_FILE_PATH/${SCHEMANAME}_procedure_$(date +%Y%m%d).sql"

	# echo $PROCEDURE_BACKUP_FILE;

	echo "Start Procedure Backup : "${SCHEMANAME} "Procedure" $(date)

	mysqldump --single-transaction --routines --no-create-info --no-data --no-create-db -u"$DB_USER" -p"$DB_PASS" --skip-triggers --compact "$SCHEMANAME" > "$PROCEDURE_BACKUP_FILE"
	
	echo "End Procedure Backup : "${SCHEMANAME} "Procedure" $(date)

done
