## Bug Fix

## Bug 1: Nginx 404 Error on Page Refresh

### Problem

When deploying the application from a Docker container, routing was not working correctly. Nginx was returning a 404 error when trying to access the routes.

### Solution

The issue was resolved by adding a custom Nginx configuration file to the project root and modifying the Dockerfile to copy this configuration into the Docker image. The Nginx configuration file was set up to always serve the `index.html` file, which then loads the JavaScript and handles the routing on the client side.

Here's the content of the `nginx.conf` file:

```nginx
server {
    listen 80;
    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
        try_files $uri $uri/ /index.html;
    }
}
```

And the Dockerfile was modified to include this line:

```Dockerfile
COPY nginx.conf /etc/nginx/conf.d/default.conf
```
