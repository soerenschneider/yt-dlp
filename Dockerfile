FROM python:3.12.0

RUN apt-get -y update \
    && apt-get install --no-install-recommends -y ffmpeg brotli \
    && rm -rf /var/lib/apt/* \
    && apt remove apt --autoremove -y --allow-remove-essential

RUN useradd --create-home --shell /bin/bash yt
USER yt
WORKDIR /home/yt

COPY requirements.txt .
RUN pip3 install -r requirements.txt --user

ENTRYPOINT ["/home/yt/.local/bin/yt-dlp"]
