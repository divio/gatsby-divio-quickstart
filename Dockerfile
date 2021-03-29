FROM node:14.15.1-alpine

RUN apk add --no-cache \
  make g++ && \
  apk add vips-dev fftw-dev --update-cache \
  && rm -fR /var/cache/apk/*

# set the working directory
WORKDIR /app
# copy the repository files to it
COPY . /app

RUN npm install -g
RUN npm install -g gatsby-cli

RUN gatsby build

EXPOSE 80

CMD gatsby serve --port 80 --host 0.0.0.0
