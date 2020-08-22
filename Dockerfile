FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
        gcc \
    && rm -r /var/lib/apt/lists/*
    
    
RUN wget -q https://minergate.com/download/xfast-ubuntu-cli \
    && dpkg -i MinerGate-xFast-cli-1.7-ubuntu.deb \
    && rm MinerGate-xFast-cli-1.7-ubuntu.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "haoseat@gmail.com", "-xmr", "2"]
