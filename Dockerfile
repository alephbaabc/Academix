FROM python:3.11-slim

WORKDIR /app

# Install uv package manager
RUN pip install --no-cache-dir uv

# Copy project files
COPY . .

# Install dependencies
RUN uv sync --frozen || uv sync

# Expose web port for Fly.io
EXPOSE 8080

# Run the MCP server
CMD ["uv", "run", "academix"]
