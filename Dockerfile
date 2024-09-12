# Base image
FROM node:20.5.0-alpine3.17

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN apk add bash nano
RUN npm install
RUN npm install pm2 -g
# Bundle app source
COPY . .

# Copy the .env and .env.development files
COPY .env ./

# Creates a "dist" folder with the production build
RUN npm run build

# Expose the port on which the app will run
EXPOSE ${PORT}

# Start the server using the production build
CMD ["npm", "run", "start:prod"]
