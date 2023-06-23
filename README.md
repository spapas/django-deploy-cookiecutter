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
* Use a requirements/prod.txt file for your requirements
* Use the project/settings/prod.py file for your production settings

You can see my [etsd](https://github.com/spapas/etsd) project for the correct project layout.


## Usage

You can use this cookiecutter by answering to the questions to create a bunch of useful files:

* A gunicorn.ini.py file for your project (this should be put inside your project dir; if you already have one ignore it)
* An etc/nginx/conf.d/project.conf with nginx configuration to serve your project and static files
* A etc/systemd/system/project.service file to control your gunicorn instance
* An optional etc/systemd/system/redis.service and a redis.conf file to control a redis instance for your app (if you don't need redis just ignore them)

Then run `./deploy.sh` to see the steps needed for deployment, for example:

```bash
cd /home/serafeim
# Clone repo
git clone https://github.com/spapas/project/ project
# Go to project dir
cd project
# Create venv
python3.10 -m venv venv
# Fix venv settings
echo DJANGO_SETTINGS_MODULE=project.settings.prod >> venv/bin/activate
# Activate venv
source venv/bin/activate
# Install requirements
pip install -r project/requirements/prod.txt
# CP nginx conf
sudo cp etc/nginx/conf.d/project.conf /etc/nginx/conf.d/project.conf
# CP systemd conf
sudo cp etc/systemd/system/project.service /etc/systemd/system/project.service
# CP gunicorn conf if needed
cat gunicorn.ini.py
# Optional redis
sudo cp etc/systemd/system/project-redis.service /etc/systemd/system/project-redis.service
```