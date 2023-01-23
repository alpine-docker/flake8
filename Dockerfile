FROM python:3-alpine

# Need docker build arg, such as --build-arg FLAKE8_VERSION=3.0.4
ARG FLAKE8_VERSION

RUN pip install flake8==$FLAKE8_VERSION
RUN pip install flake8-sarif

WORKDIR /apps

ENTRYPOINT ["flake8"]
CMD ["--help"]
