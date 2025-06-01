FROM ghcr.io/jitesoft/tesseract:5.5.1-alpine

# Add Python + pip + dependencies
RUN apk add --no-cache python3 py3-pip py3-pillow

# Install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy FastAPI app
COPY app.py .

# Expose port and run
EXPOSE 8000
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
