# flake8
Auto-trigger docker build for flake8 when new release is announced

# Usage:

    # must mount the local folder to /apps in container.
    docker run -ti --rm -v $(pwd):/apps alpine/flake8 local_file.py

    # run flake8 container as command
    alias flake="docker run -ti --rm -v $(pwd):/apps alpine/flake8"
    flake --help
    flake local_file.py

# The Processes to build this image

* enable travis ci cronjob on this repo to run build daily on master branch
* check if there are new tags/releases announced
* match the exist tags
* if not found, build the image with latest tag and push to hub.docker.com

