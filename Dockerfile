# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Install Git in the alpine nginx image
RUN apk add --no-cache git

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Clone your GitHub repository into a temporary directory
RUN git clone https://github.com/djtoler/hwthdemo3.git /tmp/hwthdemo && \
    mv /tmp/hwthdemo/* ./ && \
    rm -rf /tmp/hwthdemo && \
    chmod -R 755 /usr/share/nginx/html

# Debugging step: List the contents of the Nginx HTML directory
RUN ls -l /usr/share/nginx/html

# Expose port 80 for the nginx server
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
