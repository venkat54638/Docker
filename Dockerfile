FROM python:3.13.3

WORKDIR /app

# Install system dependencies for building packages
RUN apt-get update && apt-get install -y build-essential

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

CMD ["uvicorn", "app:app", "--host", "localhost", "--port", "8000"]
