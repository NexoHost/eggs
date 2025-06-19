#!/bin/ash

# Colors for output
GREEN="\033[1;92m"
YELLOW="\033[1;93m"
RED="\033[1;91m"
CYAN="\033[1;96m"
RESET="\033[0m"
BOLD="\033[1m"

# Banner NexoHost.es
echo "${CYAN}╔════════════════════════════════════════════════════════════╗"
echo "║             ${BOLD}🚀  Bienvenido a NexoHost.es  🚀${CYAN}             ║"
echo "╚════════════════════════════════════════════════════════════╝${RESET}"

# Function to print messages with colors and visual border
log_success() {
    echo -e "${GREEN}║ [✔] $1${RESET}"
}

log_warning() {
    echo -e "${YELLOW}║ [!] $1${RESET}"
}

log_error() {
    echo -e "${RED}║ [✖] $1${RESET}"
}

log_info() {
    echo -e "${CYAN}║ [⏳] $1${RESET}"
}

# Frame top
echo "${CYAN}╔════════════════════════════════════════════════════════════╗${RESET}"

# Clean up temp directory
log_info "Cleaning up temporary files..."
if rm -rf /home/container/tmp/*; then
    log_success "Temporary files removed successfully."
else
    log_error "Failed to remove temporary files."
    echo "${CYAN}╚════════════════════════════════════════════════════════════╝${RESET}"
    exit 1
fi

# Start PHP-FPM
log_info "Starting PHP-FPM..."
if /usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize; then
    log_success "PHP-FPM started successfully."
else
    log_error "Failed to start PHP-FPM."
    echo "${CYAN}╚════════════════════════════════════════════════════════════╝${RESET}"
    exit 1
fi

# Start NGINX
log_info "Starting Nginx..."
if /usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/; then
    log_success "Web server is running. All services started successfully."
else
    log_error "Failed to start Nginx."
    echo "${CYAN}╚════════════════════════════════════════════════════════════╝${RESET}"
    exit 1
fi

# Frame bottom
echo "${CYAN}╚════════════════════════════════════════════════════════════╝${RESET}"

# Keep the container running
tail -f /dev/null
