#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

failed=0

echo "[Peppery] Verificação da estrutura"

required=(
  "README.md"
  "VERSION"
  "image-definitions/peppery-amd64.yaml"
  "config/branding/etc/peppery-release"
  "scripts/bootstrap-host.sh"
  "scripts/build.sh"
)

for path in "${required[@]}"; do
  if [[ -e "${path}" ]]; then
    printf '  OK   %s\n' "${path}"
  else
    printf '  ERRO %s\n' "${path}"
    failed=1
  fi
done

echo
echo "[Peppery] Validação YAML"

python3 - <<'PY'
from pathlib import Path
import yaml

path = Path("image-definitions/peppery-amd64.yaml")
data = yaml.safe_load(path.read_text(encoding="utf-8"))

required = ["name", "display-name", "architecture", "series", "class", "rootfs", "artifacts"]
missing = [key for key in required if key not in data]

if missing:
    raise SystemExit(f"Campos obrigatórios em falta: {', '.join(missing)}")

if data["series"] != "resolute":
    raise SystemExit("A série esperada é resolute (Ubuntu 26.04 LTS).")

if data["architecture"] != "amd64":
    raise SystemExit("A arquitetura inicial esperada é amd64.")

print("  OK   image-definitions/peppery-amd64.yaml")
PY

if command -v shellcheck >/dev/null 2>&1; then
  echo
  echo "[Peppery] ShellCheck"
  shellcheck scripts/*.sh
  echo "  OK   scripts shell"
else
  echo
  echo "[Peppery] AVISO: shellcheck não instalado; validação shell ignorada."
fi

if [[ "${failed}" -ne 0 ]]; then
  exit 1
fi

echo
echo "[Peppery] Verificações concluídas sem erros."
