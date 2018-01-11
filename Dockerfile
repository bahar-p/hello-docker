FROM node:latest

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install --production

# Bundle app source
COPY . .

#expose port
EXPOSE 3000
CMD [ "node", "app.js" ]


