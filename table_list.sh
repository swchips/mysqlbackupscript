#!/bin/bash

# MySQL Connection Set
DB_USER="root"
DB_PASS="090800"

# Backup Directory Set
TODAY=$(date +%Y%m%d)
BACKUP_PATH="$HOME/table_list"
BACKUP_DIR_TODAY="$BACKUP_DIR/$TODAY"
mkdir -p "$BACKUP_PATH/$BACKUP_DIR_TODAY"

# DATABASE LIST
DBLISTS="/root/dblist.txt"

for SCHEMANAME in $(cat "$DBLISTS"); do

	# DATABASE LIST
	TABLES=$(mysql -u $DB_USER -p$DB_PASS -N -B -e "SHOW TABLES FROM $SCHEMANAME")
	
	echo "Create Start Table : $SCHEMANAME"
	echo "$TABLES" > $BACKUP_PATH/$BACKUP_DIR_TODAY/$SCHEMANAME"_tblist".txt
	echo "End Table : $SCHEMANAME" $(date)
done


