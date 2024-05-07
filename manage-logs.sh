LOG_DIR="/c/Users/muhan/236inf/docker-frontend-backend-db/docker-logs"

if [ ! -d "$LOG_DIR" ]; then
  mkdir -p $LOG_DIR
fi

echo "Fetching logs from Docker containers..."
docker-compose logs > "${LOG_DIR}/$(date +%F-%T)-docker-logs.txt"

echo "Logs have been saved to ${LOG_DIR}."