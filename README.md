# flake8
Auto-trigger docker build for flake8 when new release is announced

# Usage:

    # must mount the local folder to /apps in container.
    docker run -ti --rm -v $(pwd):/apps alpine/flake8:3.5.0 local_file.py

    # run flake8 container as command
    alias flake="docker run -ti --rm -v $(pwd):/apps alpine/flake8:3.5.0"
    flake --help
    flake local_file.py

# The Processes to build this image

* Enable Travis CI cronjob on this repo to run build daily on master branch
* Check if there are new tags/releases announced in flake8 via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with latest version as tag and push to hub.docker.com
