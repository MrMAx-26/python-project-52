#!/bin/bash

# Укажите путь к виртуальному окружению
VENV_PATH=".venv/bin/python"  # Для Linux или macOS
# VENV_PATH=".venv\Scripts\python.exe"  # Для Windows (раскомментируйте эту строку, если используете Windows)

# Убедитесь, что виртуальное окружение создано
if [ ! -d ".venv" ]; then
    python -m venv .venv
fi

# Установка зависимостей
$VENV_PATH -m pip install --upgrade pip  # Обновление pip
$VENV_PATH -m pip install -r requirements.txt

# Запуск миграций
$VENV_PATH manage.py migrate

# Запуск сервера
$VENV_PATH manage.py runserver 0.0.0.0:8000