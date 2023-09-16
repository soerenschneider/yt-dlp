FROM python:3.11.5

RUN apt-get -y update && apt-get install --no-install-recommends -y ffmpeg \
    brotli \
    && rm -rf /var/lib/apt/*

RUN apt remove apt --autoremove -y --allow-remove-essential

ADD yt-dlp.sh requirements.txt .
ADD yt_dlp yt_dlp
RUN pip3 install -r requirements.txt


ENTRYPOINT ["./yt-dlp.sh"]
