# Use the official Node.js v18 image
FROM node:18-alpine as base

# Set the working directory to /src
WORKDIR /src

# Copy package.json and package-lock.json files into the working directory
COPY package*.json ./

# Set the environment variable NODE_ENV to 'production'
ENV NODE_ENV=production

# Install dependencies
RUN npm ci

# Copy the main application file, index.js, into the working directory
COPY index.js ./

# Copy the .env file into the working directory
COPY .env ./

# Expose port 3000
EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]