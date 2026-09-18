#!/usr/bin/env bash
set -euo pipefail

if [[ "${EUID}" -ne 0 ]]; then
  echo "Executa este script com sudo: sudo bash scripts/bootstrap-host.sh"
  exit 1
fi

if ! command -v apt-get >/dev/null 2>&1; then
  echo "Este bootstrap foi preparado para Ubuntu/Debian."
  exit 1
fi

echo "[Peppery] A atualizar os índices APT..."
apt-get update

echo "[Peppery] A instalar dependências do host..."
apt-get install -y \
  git \
  snapd \
  qemu-system-x86 \
  qemu-utils \
  ovmf \
  shellcheck \
  python3 \
  python3-yaml

if ! command -v snap >/dev/null 2>&1; then
  echo "Erro: snap não ficou disponível."
  exit 1
fi

if ! snap list ubuntu-image >/dev/null 2>&1; then
  echo "[Peppery] A instalar ubuntu-image..."
  snap install ubuntu-image --classic
else
  echo "[Peppery] ubuntu-image já está instalado."
fi

echo
echo "[Peppery] Ambiente preparado."
echo "Próximo passo: make check"
