# Apache Hello World

```bash
docker build -t apache-hello-world ./apache-app
docker run --rm -p 8081:80 apache-hello-world
```

Open http://localhost:8081.
