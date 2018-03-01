# flake8
Auto-trigger docker build for flake8 when new release is announced

# Processes

* enable travis ci cronjob on this repo to run build daily on master branch
* check if there are new tags/releases announced
* match the exist tags
* if not found, build the image with latest tag and push to hub.docker.com
