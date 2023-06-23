# django-deploy-cookiecutter

A [cookiecutter](https://cookiecutter.readthedocs.io/en/stable/) to help you deploy your Django projects in RHEL! This has been mainly implemented to cover my needs but feel free to use/fork this!

## Requirements

For everything to work smoothly you need to:

* Use gunicorn as an app server
* Use systemd to control gunicorn
* Use nginx as a web server
* Use a base dir where you'll hold all your projects f.e /home/serafeim
* Use a base project path for this project f.e /home/serafeim/project
* Clone your project on /home/serafeim/project/project
* Servce your static files from /home/serafeim/project/static
* Keep logs on /home/serafeim/project/logs
* Keep your venv on /home/serafeim/project/venv

You can see my [etsd](https://github.com/spapas/etsd) project for the correct project layout.


## Usage

```bash
cd {{ cookiecutter.base_path }}
# Clone repo
git clone {{ cookiecutter.repo }} {{ cookiecutter.project_slug }}
# Go to project dir
cd {{ cookiecutter.project_slug }}
# Create venv
{{ cookiecutter.python }} -m venv venv
# Fix venv settings
echo DJANGO_SETTINGS_MODULE={{ cookiecutter.project_slug }}.settings.prod >> venv/bin/activate
# Activate venv
source venv/bin/activate
# Install requirements
pip install -r {{ cookiecutter.project_slug}}/requirements/prod.txt
# CP nginx conf
sudo cp etc/nginx/conf.d/{{ cookiecutter.project_slug}}.conf /etc/nginx/conf.d/{{ cookiecutter.project_slug}}.conf
# CP systemd conf
sudo cp etc/systemd/system/{{ cookiecutter.project_slug}}.service /etc/systemd/system/{{ cookiecutter.project_slug}}.service
# CP gunicorn conf if needed
cat gunicorn.ini.py
```