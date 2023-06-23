#!/bin/bash

echo "STARTING"
echo "> cd {{ cookiecutter.base_path }}"

echo "Clone repo"
echo "> git clone {{ cookiecutter.repo }} {{ cookiecutter.project_slug }} "

echo "Go to project dir"
echo "> cd {{ cookiecutter.project_slug }}"

echo "Create venv"
echo "> {{ cookiecutter.python }} -m venv venv"

echo "Fix venv settings"
echo "> echo DJANGO_SETTINGS_MODULE={{ cookiecutter.project_slug }}.settings.prod >> venv/bin/activate"

echo "Activate venv"
echo "> source venv/bin/activate"

echo "Install requirements"
echo "> pip install -r {{ cookiecutter.project_slug}}/requirements/prod.txt"

echo "CP nginx conf"
echo "> sudo cp etc/nginx/conf.d/{{ cookiecutter.project_slug}}.conf /etc/nginx/conf.d/{{ cookiecutter.project_slug}}.conf"

echo "CP systemd conf"
echo "> sudo cp etc/systemd/system/{{ cookiecutter.project_slug}}.service /etc/systemd/system/{{ cookiecutter.project_slug}}.service"

echo "CP gunicorn conf if needed"
echo "> cat gunicorn.ini.py"

