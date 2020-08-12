FROM r-base

RUN apt update
RUN apt install -y libcurl4-openssl-dev libssl-dev libssh2-1-dev libxml2-dev zlib1g-dev

COPY ./install_packages.r /install_packages.r
RUN Rscript /install_packages.r

CMD ["R"]