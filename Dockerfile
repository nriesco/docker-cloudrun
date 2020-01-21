FROM node:12
WORKDIR /usr/src/app
COPY package*.json ./
#COPY .npmrc ./ # for private repos!
RUN npm install --only=production
COPY . .
CMD [ "npm", "start" ]