FROM python:3.11.5

RUN apt-get -y update \
    && apt-get install --no-install-recommends -y ffmpeg brotli \
    && rm -rf /var/lib/apt/* \
    && apt remove apt --autoremove -y --allow-remove-essential

RUN useradd --create-home --shell /bin/bash yt
USER yt
WORKDIR /home/yt

RUN pip3 install --user yt-dlp==2023.7.6

ENTRYPOINT ["/home/yt/.local/bin/yt-dlp"]
