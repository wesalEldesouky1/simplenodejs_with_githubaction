# Use an official Node.js runtime as the base image
FROM --platform=linux/arm64 node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the app's source code to the working directory
COPY . .

# Expose the port that the app will listen on
EXPOSE 3000

# Define the command to run the app
CMD [ "node", "server.js" ]
