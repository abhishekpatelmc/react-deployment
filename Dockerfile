# Stage 1: Build the application using Node.js 20
FROM node:20-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app's source code into the container
COPY . .

# Build the application
RUN npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:stable-alpine

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built assets from the build stage to the Nginx serve directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80 to the outside once the container has launched
EXPOSE 80

# Define the command to run your app using Nginx
CMD ["nginx", "-g", "daemon off;"]