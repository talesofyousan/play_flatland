FROM tensorflow/tensorflow:latest-py3-jupyter
MAINTAINER yusan1871@gmail.com

# Install dependencies
# RUN add-apt-repository ppa:jonathonf/python-3.6
ENV DEBIAN_FRONTEND=noninteractive

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
    tmux

RUN apt-get update && apt-get install -y \
    libgtk2.0-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
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
    redis \
    && apt-get -y clean all \
    && rm -rf /var/lib/apt/lists/*


RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py

# Locale setting
ENV LANG ja_JP.UTF-8
RUN update-locale LANG=$LANG

COPY requirements.txt .
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# ROOTにパスワードをセット
# RUN echo 'root:hogehoge' | chpasswd

# ユーザを作成
# RUN useradd -m yutaro.kikuchi
# RUN echo 'yutaro.kikuchi:hogehoge' | chpasswd
# RUN echo "yutaro.kikuchi    ALL=(ALL)       ALL" >> /etc/sudoers
# RUN groupadd -g 1459006994 Users
# RUN usermod -g 1459006994 -u 844071196 yutaro.kikuchi

# RUN chmod -R 755 /root

# USER yutaro.kikuchi
# WORKDIR /home/yutaro.kikuchi

# For Tensorboard
EXPOSE 6006

# For jupyterlab
EXPOSE 8888

CMD ["/usr/sbin/sshd", "-D"]