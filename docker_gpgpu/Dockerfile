FROM gpu-registry:5000/brainpad:latest-gpu-py3-cuda10
MAINTAINER yusan1871@gmail.com

# Install dependencies
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN set -ex && apt-get update && apt-get install -y \
    less \
    vim \
    man \
    wget \
    cmake \
    byobu \
    language-pack-ja \
    unzip \
    git \
    libgtk2.0-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    # python3-numpy \
    # python3-tk \
    # python3-pip \
    # python3-dev \
    nscd \
    graphviz \
    python3.6 \
    python3.6-dev\
    python3.6-tk \
    protobuf-compiler \
    python-pil \
    python-lxml \
	xvfb \
	freeglut3-dev \
	ffmpeg \
	libsm6 \
	libxrender1 \
    && apt-get -y clean all \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py

# Locale setting
ENV LANG ja_JP.UTF-8
RUN update-locale LANG=$LANG

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt

# For Tensorboard
EXPOSE 6006

# For jupyterlab
EXPOSE 8888

CMD ["/usr/sbin/sshd", "-D"]