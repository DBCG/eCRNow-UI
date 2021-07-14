FROM node:12

# Create app directory
WORKDIR /usr/src/app

EXPOSE 5000
RUN npm install -g serve

COPY package*.json ./

RUN npx browserslist@latest --update-db
RUN npm install

# Bundle app source
COPY src src
COPY public public

ENV NODE_ENV=production

RUN npm run build

CMD [ "serve", "-s", "build" ]