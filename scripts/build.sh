#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

IMAGE_DEF="image-definitions/peppery-amd64.yaml"
WORK_DIR="${ROOT_DIR}/build/work"
OUT_DIR="${ROOT_DIR}/build/out"

if ! command -v ubuntu-image >/dev/null 2>&1; then
  if [[ -x /snap/bin/ubuntu-image ]]; then
    UBUNTU_IMAGE=/snap/bin/ubuntu-image
  else
    echo "ubuntu-image não encontrado."
    echo "Executa: sudo bash scripts/bootstrap-host.sh"
    exit 1
  fi
else
  UBUNTU_IMAGE="$(command -v ubuntu-image)"
fi

mkdir -p "${WORK_DIR}" "${OUT_DIR}"

echo "[Peppery] Definição: ${IMAGE_DEF}"
echo "[Peppery] Workdir:   ${WORK_DIR}"
echo "[Peppery] Output:    ${OUT_DIR}"
echo

sudo "${UBUNTU_IMAGE}" \
  --workdir="${WORK_DIR}" \
  --output-dir="${OUT_DIR}" \
  classic "${IMAGE_DEF}"

echo
echo "[Peppery] Build concluído."
ls -lh "${OUT_DIR}"
