#!/bin/bash

# MySQL Connection Set
DB_USER="root"
DB_PASS="090800"

# Backup Directory Set
BACKUP_DIR="$HOME/"

# DATABASE LIST
DBLISTS=$(mysql -u $DB_USER -p$DB_PASS -N -B -e "SHOW DATABASES")

# DataBase LIST File Set
echo "$DBLISTS" | grep -Ev "(Database|information_schema|performance_schema|sys|mysql)" > $BACKUP_DIR/dblist.txt
echo "End DBList File: " $(date)
