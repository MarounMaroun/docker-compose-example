FROM ubuntu:latest

LABEL maintainer="maroun.bassam@gmail.com"

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential vim

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["src/main.py"]
