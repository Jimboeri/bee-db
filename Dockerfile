FROM python:3.12.0a5-slim
ENV PYTHONDONTWRITEBYTECODE 1 \
    PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN apt-get update && apt-get -y upgrade && apt-get -y install libpq-dev gcc cmake \
    curl \
    ghostscript \
    git \
    libffi-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libjpeg-turbo-progs \
#    libjpeg8-dev \
    liblcms2-dev \
    libopenjp2-7-dev \
    libssl-dev \
    libsqlite3-dev \
    libtiff5-dev \
    libwebp-dev \
    netpbm \
    ninja-build \
    sudo \
    tcl8.6-dev \
    tk8.6-dev \
    wget \
    xvfb \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*
RUN pip install -r requirements.txt
COPY . /code/
WORKDIR /code/bee/
