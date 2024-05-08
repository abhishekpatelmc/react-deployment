# React Deployment

> Deploying React App using Docker

Create Docker Image

```
docker build -t my-react-app .
```

Run Docker Image

```
docker run -p 80:80 --name react-app-container my-react-app
```

Access the React App

```
http://localhost
```
