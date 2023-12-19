FROM python:3.10-alpine

WORKDIR '/app'

RUN pip install django
RUN pip install gunicorn

RUN django-admin startproject docker_test

COPY . .

WORKDIR '/app/docker_test'
CMD ["gunicorn", "-b", "0.0.0.0:8000", "docker_test.wsgi"]
