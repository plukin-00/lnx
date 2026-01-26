# Automates Docker Compose update: stop, pull, up -d, with optional logs.
function update_docker() {
  echo "Stopping Docker Compose services..."
  docker compose stop

  echo "Pulling latest images..."
  docker compose pull

  echo "Starting Docker Compose services in detached mode..."
  docker compose up -d

  echo "Prune old images..."
  docker image prune -f

  # If 'logs' is the first argument, follow logs afterward
  if [ "$1" == "logs" ]; then
    echo "--- Following logs (Press Ctrl+C to exit) ---"
    docker compose logs -f
  fi
}
