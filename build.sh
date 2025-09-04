#!/usr/bin/env bash
# скачиваем uv
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/venv



# здесь добавьте все необходимые команды для установки вашего проекта
# команду установки зависимостей, сборки статики, применения миграций и другие
# Укажите явный путь к интерпретатору Python в виртуальном окружении
VENV_PYTHON="$PWD/venv/bin/python"

# Проверьте, что Python использует правильное окружение
$VENV_PYTHON -m pip install -r requirements.txt

# Запустите миграции и статику, используя Python из виртуального окружения
$VENV_PYTHON manage.py collectstatic --noinput
$VENV_PYTHON manage.py migrate

# Запустите сервер
$VENV_PYTHON manage.py runserver