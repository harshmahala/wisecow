FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd

ENV PATH="/usr/games:${PATH}"

WORKDIR /app

COPY . .

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["bash", "wisecow.sh"]