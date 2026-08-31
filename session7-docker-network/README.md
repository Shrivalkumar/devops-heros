# Docker Network Homework

## Files

- `docker-compose.yml` creates the containers and three networks.
- `bind-mount-site/index.html` is the file mounted into the nginx container.

## 1. Frontend, backend, DB, and networks

Run these commands from this folder:

```sh
docker compose up -d frontend backend db
docker ps
docker network ls
docker network inspect frontend-network
docker network inspect database-network
docker network inspect isolated-network
```

Take a screenshot here. It shows the three running containers, the three networks, and that `backend` belongs to both `frontend-network` and `database-network`.

## 2. Connectivity checks

Run:

```sh
# frontend and backend share frontend-network
docker exec frontend ping -c 3 backend

# backend can reach frontend through frontend-network
docker exec backend ping -c 3 frontend

# backend can reach MySQL through database-network
docker exec backend nc -zv db 3306

# frontend cannot resolve db because it is not on database-network
docker exec frontend ping -c 1 db
```

Take a screenshot of the first three successful commands. The last command is expected to fail; take a screenshot of it too to show the networks are separated.

## 3. Apache using the host network

Run:

```sh
docker pull httpd:2.4
docker compose --profile host-network up -d apache-host
docker ps
curl http://localhost:80
```

Open `http://localhost:80` in a browser and take a screenshot of the Apache test page.

> On Docker Desktop, enable **Settings → Resources → Network → Enable host networking** before starting this container. Port 80 must not already be used.

## 4. nginx bind mount

Run:

```sh
docker compose --profile bind-mount up -d nginx-bind-mount
open http://localhost:8081
```

Take a screenshot of the browser showing **Hello students**.

Now edit `bind-mount-site/index.html` (for example, change the heading to `Hello students - updated`), save it, and refresh `http://localhost:8081`. Do not restart the container.

Take a screenshot of the refreshed page and this command:

```sh
docker ps --filter name=nginx-bind-mount
```

The updated page while the nginx container is still running proves the bind mount works.

## Cleanup

When finished, run:

```sh
docker compose --profile host-network --profile bind-mount down
```

## Screenshots

### Containers running

![Containers running](screenshots/01-containers.png)

### Three networks

![Docker networks](screenshots/02-networks.png)

### Network inspection

![Network inspection](screenshots/03-network-inspect.png)

### Frontend to backend connectivity

![Frontend to backend ping](screenshots/04-frontend-backend.png)

### Backend to frontend connectivity

![Backend to frontend ping](screenshots/05-backend-frontend.png)

### Backend to database connectivity

![Backend to database connection](screenshots/06-backend-db.png)

### Frontend cannot reach database

![Frontend database connection blocked](screenshots/07-frontend-db-blocked.png)

### Apache using host network

![Apache host network](screenshots/08-apache-host-network.png)

### nginx bind mount

![nginx showing Hello students](screenshots/09-nginx-bind-mount.png)
