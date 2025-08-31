#!/bin/bash

# Configuration
BACKUP_DIR="/var/backups/postgres"
DB_USER="postgres"
DB_NAME="amsoc"
BACKUP_RETENTION_DAYS=30
LOG_FILE="/home/amrita/backup/postgres_backup.log"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${TIMESTAMP}.sql.gz"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Logging function
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Check if pg_dump is installed
if ! command -v pg_dump &> /dev/null; then
    log "ERROR: pg_dump not found. Please install PostgreSQL client tools."
    exit 1
fi

# Perform backup
log "Starting backup of $DB_NAME"
if pg_dump -U "$DB_USER" "$DB_NAME" | gzip > "$BACKUP_FILE"; then
    log "Backup successful: $BACKUP_FILE"
else
    log "ERROR: Backup failed for $DB_NAME"
    exit 1
fi

# Clean up old backups
log "Cleaning up backups older than $BACKUP_RETENTION_DAYS days"
find "$BACKUP_DIR" -name "${DB_NAME}_*.sql.gz" -mtime +"$BACKUP_RETENTION_DAYS" -delete

log "Backup process completed"
