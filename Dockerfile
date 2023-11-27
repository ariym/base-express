# Use an official Node.js runtime as a base image
FROM node:19

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./
# also prisma directory
COPY prisma ./prisma/

# Install app dependencies
RUN npm install

RUN npx prisma migrate dev --name init

# Bundle your app source code inside the Docker image
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Define the command to run your app
CMD ["npm", "start"]
