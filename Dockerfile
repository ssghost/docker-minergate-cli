FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
    && rm -r /var/lib/apt/lists/*

RUN wget -q --content-disposition https://minergate.com/download/deb-cli \
    && dpkg -i *.deb \
    && rm *.deb
    
RUN apt-get install apt-utils libxcb1 libx11-xcb1 libxcb-keysyms1 libxcb-image0 libxcb-shm0 libxcb-icccm4 libxcb-render-util0

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "haoseat@gmail.com", "-xmr", 2]
