#!/bin/ash

# Colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
CYAN="\033[1;36m"
RESET="\033[0m"
BOLD="\033[1m"

# Display banner with color interpretation
echo -e "${CYAN}============================================================"
echo -e "${BOLD}${CYAN}         🚀  Welcome to NexoHost.es       ${RESET}${CYAN}"
echo -e "============================================================${RESET}"

# Logging functions
log_success() {
    echo -e "${GREEN}[✔] $1${RESET}"
}

log_warning() {
    echo -e "${YELLOW}[!] $1${RESET}"
}

log_error() {
    echo -e "${RED}[✖] $1${RESET}"
}

log_info() {
    echo -e "${CYAN}[⏳] $1${RESET}"
}

# Processes

log_info "Removing temporary files..."
if rm -rf /home/container/tmp/*; then
    log_success "Temporary files removed successfully."
else
    log_error "Failed to remove temporary files."
    exit 1
fi

log_info "Starting PHP-FPM..."
if /usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize; then
    log_success "PHP-FPM started successfully."
else
    log_error "Failed to start PHP-FPM."
    exit 1
fi

log_info "Starting Nginx..."
if /usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/; then
    log_success "Web server is running correctly."
else
    log_error "Failed to start Nginx."
    exit 1
fi

echo -e "${CYAN}============================================================${RESET}"
log_success "All services were started successfully. 🚀"
echo -e "${CYAN}============================================================${RESET}"

# Keep the container running
tail -f /dev/null
