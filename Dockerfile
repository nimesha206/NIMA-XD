FROM node:lts-buster
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*
USER node
RUN git clone https://github.com/nimesha206/NIMA-XD.git /home/node/NIMA-XD
WORKDIR /home/node/NIMA-XD
RUN chmod -R 777 /home/node/NIMA-XD/
RUN yarn install --network-concurrency 1
EXPOSE 7860
ENV NODE_ENV=production
CMD ["npm", "start"]
