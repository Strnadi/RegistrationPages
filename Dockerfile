# Use the official Nginx image
FROM nginx:alpine

# Copy all HTML pages to Nginx's public directory
COPY index.html /usr/share/nginx/html/index.html
COPY forgotten-password.html /usr/share/nginx/html/forgotten-password.html
COPY 404.html /usr/share/nginx/html/404.html

# Copy the custom Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for HTTP
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

