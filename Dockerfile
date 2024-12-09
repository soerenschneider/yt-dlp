FROM python:3.13.1

RUN apt-get -y update \
    && apt-get install --no-install-recommends -y ffmpeg brotli \
    && rm -rf /var/lib/apt/* \
    && apt remove apt --autoremove -y --allow-remove-essential


COPY requirements.txt /
RUN pip3 install -r /requirements.txt

RUN useradd --create-home --shell /bin/bash yt
USER yt

ENTRYPOINT ["yt-dlp"]
