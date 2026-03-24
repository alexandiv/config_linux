#!/bin/bash

BACKUP_ROOT="/mnt/backup"
LATEST="$BACKUP_ROOT/latest"
DATE=$(date +%F)
DEST="$BACKUP_ROOT/$DATE"

EXCLUDES=(
  --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*"}
  --exclude={"/lost+found","/var/cache/pacman/pkg/*","/home/*"}
)

# Если есть предыдущий бэкап — используем hard links
if [ -d "$LATEST" ]; then
  LINK_DEST="--link-dest=$LATEST"
else
  LINK_DEST=""
fi

# Бэкап корня
rsync -aAXHv --delete $LINK_DEST "${EXCLUDES[@]}" / "$DEST/root/"

# Бэкап EFI
rsync -av --delete $LINK_DEST /boot/efi/ "$DEST/efi/"

# Обновляем symlink "latest"
ln -sfn "$DEST" "$LATEST"

# Ротация: удаляем бэкапы старше 30 дней
find "$BACKUP_ROOT" -maxdepth 1 -type d -mtime +30 -exec rm -rf {} \;

