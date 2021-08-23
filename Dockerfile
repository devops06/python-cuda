FROM nvidia/cuda:10.2-devel-centos7

RUN yum install -y gcc openssl-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel wget vim && yum clean all

RUN cd /tmp && wget https://www.python.org/ftp/python/3.6.14/Python-3.6.14.tgz \
    && tar -xzvf Python-3.6.14.tgz \
    && cd Python-3.6.14 \
    && mkdir -p /usr/local/python3 \
    && ./configure --prefix=/usr/local/python3 \
    && make -j 20 \
    && make install \
    && rm -rf /tmp/* \
    && /usr/local/python3/bin/pip3 install torch torchvision torchaudio
