import os
os.environ["DATABASE_URL"] = "sqlite:///./test.db"

import pytest
from fastapi.testclient import TestClient
from app.db import Base, engine
from app.main import app

client = TestClient(app)


@pytest.fixture(autouse=True)
def fresh_database():
    """Keep every test independent of the development database."""
    Base.metadata.drop_all(bind=engine)
    Base.metadata.create_all(bind=engine)
    yield
    Base.metadata.drop_all(bind=engine)


def test_health():
    assert client.get("/health").json() == {"status": "UP"}

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json()["service"] == "TaskBoard API"

def test_create_task_validation():
    response = client.post("/api/tasks", json={"title": "Deploy application", "priority": "HIGH", "assignee": "Student"})
    assert response.status_code == 201
    assert response.json()["title"] == "Deploy application"


def test_list_tasks_starts_empty():
    response = client.get("/api/tasks")
    assert response.status_code == 200
    assert response.json() == []


def test_update_and_delete_task():
    created = client.post("/api/tasks", json={"title": "Write deployment notes"})
    assert created.status_code == 201
    task_id = created.json()["id"]

    updated = client.put(
        f"/api/tasks/{task_id}",
        json={"title": "Write final deployment notes", "status": "DONE"},
    )
    assert updated.status_code == 200
    assert updated.json()["status"] == "DONE"

    deleted = client.delete(f"/api/tasks/{task_id}")
    assert deleted.status_code == 204
