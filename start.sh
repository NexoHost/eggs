#!/bin/ash

# Colores
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
CYAN="\033[1;36m"
RESET="\033[0m"
BOLD="\033[1m"

# Banner
echo "${CYAN}============================================================"
echo "${BOLD}${CYAN}      🚀 Welcome to NexoHost.es 🚀        ${RESET}${CYAN}"
echo "         🚀 Bienvenido a NexoHost.es        "
echo "============================================================${RESET}"

# Funciones de log
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

# Procesos

log_info "Cleaning temp files... | Eliminando archivos temporales..."
if rm -rf /home/container/tmp/*; then
    log_success "Temp files cleaned. | Archivos temporales eliminados."
else
    log_error "Temp cleanup failed. | Error al eliminar temporales."
    exit 1
fi

log_info "Starting PHP-FPM... | Iniciando PHP-FPM..."
if /usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize; then
    log_success "PHP-FPM started. | PHP-FPM iniciado."
else
    log_error "PHP-FPM failed. | Error al iniciar PHP-FPM."
    exit 1
fi

log_info "Starting Nginx... | Iniciando Nginx..."
if /usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/; then
    log_success "Nginx running. | Nginx en ejecución."
else
    log_error "Nginx failed. | Error al iniciar Nginx."
    exit 1
fi

echo "${CYAN}============================================================${RESET}"
log_success "All services started. | Todos los servicios iniciados."
echo "${CYAN}============================================================${RESET}"

# Mantener contenedor en ejecución
tail -f /dev/null
