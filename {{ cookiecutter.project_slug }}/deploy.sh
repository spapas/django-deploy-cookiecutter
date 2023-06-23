echo "STARTING"

cd {{ cookiecutter.base_path }}

git clone {{ cookiecutter.repo }} {{ cookiecutter.project_slug }} 

{{ cookiecutter.python }} -m venv venv

echo DJANGO_SETTINGS_MODULE={{ cookiecutter.project_slug }}.settings.prod >> venv/bin/activate

