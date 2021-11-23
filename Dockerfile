FROM python:3.10

WORKDIR /home

ENV TELEGRAM_API_TOKEN="2070396707:AAG77iSKj4l7UwF5LZTDf6KdJVYwydeu1tI"
ENV TELEGRAM_ACCESS_ID="418557838"
ENV TELEGRAM_PROXY_URL=""
ENV TELEGRAM_PROXY_LOGIN=""
ENV TELEGRAM_PROXY_PASSWORD=""

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN pip install -U pip aiogram pytz && apt-get update && apt-get install sqlite3
COPY *.py ./
COPY createdb.sql ./

ENTRYPOINT ["python", "server.py"]

