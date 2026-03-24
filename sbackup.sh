#!/bin/bash

SOURCE="/home/ian"              # Что бэкапить
TARGET="ian_kubuntu25.10"

BACKUP_ROOT="/media/ian/KC3000/backups"       # Куда бэкапить (внешний диск/раздел)
DEST="$BACKUP_ROOT/$TARGET"
DATE=$(date +%F)

sudo rsync -aAXHv --delete  -f'- *cache*' -f'- *Cache*' -f'- *Trash*' /home/ian /media/ian/KC3000/backups/ian_kubuntu25.10

echo "Бэкап завершён: $DEST"

