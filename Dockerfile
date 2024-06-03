# Use Ubuntu as the base image
FROM ubuntu:latest

# Install prerequisites
RUN apt-get update && apt-get install -y \
    nodejs \
    npm

# Install pnpm
RUN npm install -g pnpm@8.14

# Copy your local n8n fork into the image
COPY . /n8n

# Set the working directory
WORKDIR /n8n

# Install dependencies and build the application
RUN pnpm install
RUN pnpm build

# Expose the port n8n will run on
EXPOSE 5678

# Set the command to start n8n
CMD ["pnpm", "start"]
