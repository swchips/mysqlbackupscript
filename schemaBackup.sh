#!/bin/bash

# MySQL Connection Set
DB_USER="root"
DB_PASS="090800"

# Backup Directory Set
BACKUP_DIR="$HOME/backup_schema"

TODAY=$(date +%Y%m%d)
BACKUP_DIR_TODAY="$BACKUP_DIR/$TODAY"
mkdir -p "$BACKUP_DIR_TODAY"

# DATABASE LIST
DBLISTS="/root/dblist.txt"


for SCHEMANAME in $(cat "$DBLISTS"); 
	do
		#Test
		# $SCHEMANAME.txt
	# Backup file name with date and time
	BACKUP_FILE="$BACKUP_DIR_TODAY/${SCHEMANAME}_$(date +%Y%m%d).sql"
	
	echo "Start $SCHEMANAME Backup : " $(date)

	# mysqldump command to backup the schema
	mysqldump --single-transaction --triggers --routines -u"$DB_USER" -p"$DB_PASS" "$SCHEMANAME" > "$BACKUP_FILE"

	sleep 1

	echo "End $SCHEMANAME Backup : " $(date)

	done
