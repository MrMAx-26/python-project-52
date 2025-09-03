#!/usr/bin/env bash

# Убедитесь, что скрипт прерывается при ошибках
set -e

# Скачиваем и устанавливаем uv
echo "Скачиваем и устанавливаем uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env

# Создание виртуального окружения, если оно не существует
if [ ! -d ".venv" ]; then
    echo "Создание виртуального окружения..."
    python -m venv .venv
fi

# Активируем виртуальное окружение
echo "Активируем виртуальное окружение..."
source .venv/bin/activate

# Установка зависимостей
echo "Установка зависимостей..."
pip install -r requirements.txt

# Выполнение команд Makefile
echo "Выполняем команды Makefile..."
make install
make collectstatic
make migrate

echo "Сборка и настройка завершены."