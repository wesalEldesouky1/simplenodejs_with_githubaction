# # Use an official Node.js runtime as the base image
# FROM node:latest

# # Set the working directory in the container
# WORKDIR /app

# # Copy the package.json and package-lock.json files to the working directory
# COPY package*.json ./

# # Install app dependencies
# RUN npm install

# # Copy the rest of the app's source code to the working directory
# COPY . .

# # Expose the port that the app will listen on
# EXPOSE 3000

# # Define the command to run the app
# CMD [ "node", "server.js" ]

# # test
# Use a multi-stage build
# Use a multi-stage build
FROM node:14 AS build

# Set up your build steps
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Final stage
FROM node:14
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY package.json package-lock.json ./
RUN npm install --production
CMD ["node", "dist/server.js"]

