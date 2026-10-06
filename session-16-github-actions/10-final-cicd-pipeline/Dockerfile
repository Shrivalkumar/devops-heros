FROM python:3.12-slim

WORKDIR /app

COPY app/ ./app/

RUN useradd --create-home appuser
USER appuser

CMD ["python", "app/calculator.py"]
