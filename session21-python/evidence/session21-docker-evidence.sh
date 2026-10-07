#!/bin/zsh
clear
cd /Users/shrivalkumar/Desktop/devops-heros/session21-python
docker compose ps
docker compose exec -T backend pytest -q
curl -fsS http://localhost:8000/health
curl -fsS http://localhost:8000/metrics | head -n 6
