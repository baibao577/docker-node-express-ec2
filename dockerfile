FROM node:lts

RUN apt-get update && apt-get -y install locales-all && apt-get install nano && apt-get -y install tmux
RUN mkdir -p /home/node/app && chown -R node:node /home/node/app
USER node
WORKDIR /home/node/app

RUN npm init --yes
RUN npm install express