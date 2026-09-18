#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE_DIR="${ROOT_DIR}/profiles"

usage() {
  cat <<'EOF'
Peppery Linux Profile Manager

Uso:
  peppery-profile.sh list
  peppery-profile.sh show <perfil>
  peppery-profile.sh install <perfil> [perfil...]

Perfis atuais:
  core dev data forensics soc pentest
EOF
}

require_root() {
  if [[ "${EUID}" -ne 0 ]]; then
    echo "Erro: a instalação de perfis requer privilégios de root."
    echo "Executa: sudo bash scripts/peppery-profile.sh install <perfil>"
    exit 1
  fi
}

profile_path() {
  local profile="$1"
  printf '%s/%s.list\n' "${PROFILE_DIR}" "${profile}"
}

validate_profile() {
  local profile="$1"
  local file
  file="$(profile_path "${profile}")"

  if [[ ! -f "${file}" ]]; then
    echo "Perfil desconhecido: ${profile}" >&2
    echo "Perfis disponíveis:" >&2
    list_profiles >&2
    exit 1
  fi
}

list_profiles() {
  find "${PROFILE_DIR}" -maxdepth 1 -type f -name '*.list' -printf '%f\n'     | sed 's/\.list$//'     | sort
}

read_packages() {
  local file="$1"
  awk '
    /^[[:space:]]*#/ { next }
    /^[[:space:]]*$/ { next }
    { gsub(/^[[:space:]]+|[[:space:]]+$/, ""); print }
  ' "${file}"
}

show_profile() {
  local profile="$1"
  validate_profile "${profile}"

  echo "Perfil: ${profile}"
  echo
  read_packages "$(profile_path "${profile}")"
}

install_profiles() {
  require_root

  if ! command -v apt-get >/dev/null 2>&1; then
    echo "Erro: este instalador requer uma base Ubuntu/Debian com apt-get."
    exit 1
  fi

  local all_packages=()
  local profile
  local package

  for profile in "$@"; do
    validate_profile "${profile}"
    echo "[Peppery] A preparar perfil: ${profile}"

    while IFS= read -r package; do
      all_packages+=("${package}")
    done < <(read_packages "$(profile_path "${profile}")")
  done

  if [[ "${#all_packages[@]}" -eq 0 ]]; then
    echo "Nenhum pacote encontrado."
    exit 1
  fi

  mapfile -t all_packages < <(printf '%s\n' "${all_packages[@]}" | sort -u)

  echo
  echo "[Peppery] Pacotes selecionados: ${#all_packages[@]}"
  printf '  - %s\n' "${all_packages[@]}"

  echo
  echo "[Peppery] A atualizar índices APT..."
  apt-get update

  echo "[Peppery] A instalar perfis..."
  DEBIAN_FRONTEND=noninteractive apt-get install -y "${all_packages[@]}"

  echo
  echo "[Peppery] Instalação concluída."
}

command="${1:-}"

case "${command}" in
  list)
    list_profiles
    ;;
  show)
    [[ "${#}" -eq 2 ]] || { usage; exit 1; }
    show_profile "$2"
    ;;
  install)
    shift
    [[ "${#}" -gt 0 ]] || { usage; exit 1; }
    install_profiles "$@"
    ;;
  -h|--help|help|"")
    usage
    ;;
  *)
    echo "Comando desconhecido: ${command}" >&2
    usage >&2
    exit 1
    ;;
esac
