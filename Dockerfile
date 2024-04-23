# Use the official Node.js image as base
FROM node:18-alpine

# update the package list
RUN apk update

# Set working directory.
WORKDIR /usr/src/app

# Copy package.json and yarn.lock
COPY package*.json ./

# Install Strapi
RUN yarn config set network-timeout 600000 -g && yarn install

# Copy the current directory contents into the container at /app
COPY ./ .

# Build the Strapi application
RUN yarn build

# Expose the port Strapi runs on
EXPOSE 1337

# Define the command to run your Strapi application
CMD ["yarn", "develop"]
