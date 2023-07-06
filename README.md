Archived, follow up project at https://github.com/alpine-docker/multi-arch-libs/tree/master/flake8

# flake8
Auto-trigger docker build for [flake8](http://flake8.pycqa.org/) when new release is announced

### Repo:

https://github.com/alpine-docker/flake8

### Daily build logs:

https://travis-ci.org/alpine-docker/flake8

### Docker iamge tags:

https://hub.docker.com/r/alpine/flake8/tags/

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
* Versions old than 3.4.0 were manually built and pushed.
