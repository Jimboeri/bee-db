<<<<<<< HEAD
#FROM python:3.10
#FROM python:3.11-rc-slim-buster
=======
FROM python:3.10.6-slim-bullseye
>>>>>>> 3cce8ac4ff3484adbc627b0405606238a10dc832
ENV PYTHONDONTWRITEBYTECODE 1 \
    PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN apt-get update && apt-get upgrade && apt-get -y install libpq-dev gcc
RUN pip install -r requirements.txt
COPY . /code/
WORKDIR /code/bee/
