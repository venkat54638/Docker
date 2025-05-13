FROM python:3.13.3

WORKDIR /app


RUN apt-get update && apt-get install -y build-essential


COPY requirements.txt .


RUN pip install --no-cache-dir -r requirements.txt


COPY . .

CMD ["uvicorn", "app:app", "--host", "localhost", "--port", "8000"]
