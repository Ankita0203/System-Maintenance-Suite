# === Colors ===
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

SRC_DIR="$1"
BACKUP_DIR="./backup"
LOG_FILE="./logs/backup.log"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
DEST="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR" ./logs

if [ -z "$SRC_DIR" ]; then
  echo -e "${RED}Usage: ./backup.sh <directory_to_backup>${RESET}"
  exit 1
fi

if [ ! -d "$SRC_DIR" ]; then
  echo -e "${RED}Error: Source directory does not exist.${RESET}"
  exit 1
fi

echo "[$(date)] Starting backup of $SRC_DIR" >> "$LOG_FILE"

tar -czf "$DEST" "$SRC_DIR" 2>>"$LOG_FILE"

if [ $? -eq 0 ]; then
  echo -e "${GREEN}Backup successful:${RESET} $DEST"
  echo "[$(date)] Backup completed successfully." >> "$LOG_FILE"
else
  echo -e "${RED}Backup failed! Check logs/backup.log for details.${RESET}"
fi
