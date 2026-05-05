#!/bin/bash
# Simple backup script for Junior SysAdmin portfolio

# Переменные
SOURCE_DIR="/home/katana"
BACKUP_DIR="/home/katana/backups"
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Создаем папку для бэкапов, если её нет
mkdir -p "$BACKUP_DIR"

# Выводим сообщение о начале
echo "Начинаю бэкап папки $SOURCE_DIR..."

# Создаем архив
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Проверяем, успешно ли создался архив
if [ -f "$BACKUP_FILE" ]; then
    echo "✅ Бэкап успешно создан: $BACKUP_FILE"
    echo "📦 Размер файла: $(du -h "$BACKUP_FILE" | cut -f1)"
else
    echo "❌ Ошибка: бэкап не создан!"
    exit 1
fi

echo "Готово!"
