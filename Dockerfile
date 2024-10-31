# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt . 

RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Run the Python ETL script
CMD [ "python", "etl.py" ]


