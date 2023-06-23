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

You can use this cookiecutter by answering to the questions to create a bunch of useful files. Then run `./deploy.sh` to see the steps needed for deployment.
