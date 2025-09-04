build:
	python -m venv venv
	. venv/bin/activate && pip install -r requirements.txt
	./build.sh

render-start:
	gunicorn task_manager.wsgi

install:
	uv sync

collectstatic:
	uv run python manage.py collectstatic --noinput

migrate:
	uv run python manage.py migrate

lint:
	uv run ruff check .

test:
	uv run python manage.py test task_manager.tests

coverage:
	uv run pytest --cov=task_manager --cov-report=xml --cov-report=term

run:
	uv run python manage.py runserver