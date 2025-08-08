# Use an official Node.js runtime as a parent image
# We are using Node.js 20-alpine for a good balance of features and image size.
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
# This step leverages Docker's build cache. If these files haven't changed,
# Docker will use the cached layer for `npm install`.
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application source code into the container
COPY . .

# Make port 3001 available to the world outside this container
# This is the port your application will run on inside the container.
EXPOSE 3001

# Command to run the application
CMD ["npm", "run", "dev"]
