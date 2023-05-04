# Use ubuntu:latest as the base image
FROM ubuntu:latest

# Install Nginx web server
RUN apt-get update && apt-get install -y nginx

# Copy the sample web page to the default Nginx document root directory
COPY index.html /var/www/html/

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx web server
CMD ["nginx", "-g", "daemon off;"]

