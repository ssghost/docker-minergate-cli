FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
    && rm -r /var/lib/apt/lists/*
    

RUN wget -q https://xorg.freedesktop.org/archive/individual/lib/libxcb-1.14.tar.xz \
    && xz -d libxcb-1.14.tar.xz
    && cp -r libxcb-1.14 /usr/bin/
    && rm libxcb-1.14.tar.xz
    
RUN wget -q --content-disposition https://minergate.com/download/deb-cli \
    && dpkg -i *.deb \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "haoseat@gmail.com", "-xmr", "2"]
