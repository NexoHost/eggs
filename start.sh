#!/bin/ash

# Colores
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
CYAN="\033[1;36m"
RESET="\033[0m"
BOLD="\033[1m"

# Mostrar banner limpio con interpretación de colores
echo -e "${CYAN}============================================================"
echo -e "${BOLD}${CYAN}         🚀  Welcome to NexoHost.es       ${RESET}${CYAN}"
echo -e "============================================================${RESET}"

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

log_info "Eliminando archivos temporales..."
if rm -rf /home/container/tmp/*; then
    log_success "Archivos temporales eliminados correctamente."
else
    log_error "Error al eliminar archivos temporales."
    exit 1
fi

log_info "Iniciando PHP-FPM..."
if /usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize; then
    log_success "PHP-FPM iniciado correctamente."
else
    log_error "Fallo al iniciar PHP-FPM."
    exit 1
fi

log_info "Iniciando Nginx..."
if /usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/; then
    log_success "Servidor web en funcionamiento correctamente."
else
    log_error "Fallo al iniciar Nginx."
    exit 1
fi

echo -e "${CYAN}============================================================${RESET}"
log_success "Todos los servicios fueron iniciados correctamente. 🚀"
echo -e "${CYAN}============================================================${RESET}"

# Mantener contenedor en ejecución
tail -f /dev/null
