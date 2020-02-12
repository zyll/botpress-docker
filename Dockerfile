FROM node:10.11

EXPOSE 3000 35729

RUN apt-get update && apt-get install -y \
    unzip

RUN wget -q https://github.com/botpress/botpress/archive/v12.5.0.zip \
    && unzip v12.5.0.zip \
    && mv botpress-12.5.0 /botpress

WORKDIR /botpress

RUN yarn install
RUN yarn build

VOLUME /botpress/out

RUN yarn global add nodemon

CMD ["nodemon", "--delay 5", "--watch", "./modules", "--exec", "yarn start"]
