FROM python:3.10.6-slim-bullseye
ENV PYTHONDONTWRITEBYTECODE 1 \
    PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
WORKDIR /code/bee/
