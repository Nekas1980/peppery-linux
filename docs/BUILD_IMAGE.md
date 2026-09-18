# Construir e testar a imagem Peppery Linux

## Estado

A imagem Peppery é construída automaticamente no GitHub Actions.

O ficheiro binário `.img` não é guardado diretamente no Git porque imagens de sistemas operativos são demasiado grandes para versionamento normal.

## Workflow

`.github/workflows/build-image.yml`

O workflow:

1. prepara um runner Ubuntu;
2. instala o `ubuntu-image` oficial;
3. valida o repositório;
4. constrói `peppery-linux-0.1.0-dev-amd64.img`;
5. inspeciona a tabela de partições;
6. calcula SHA-256;
7. tenta um arranque básico em QEMU;
8. comprime a imagem com Zstandard;
9. publica tudo como artefacto do GitHub Actions.

## Onde descarregar

No GitHub:

```text
peppery-linux
└── Actions
    └── Build Peppery Linux Image
        └── Artifacts
            └── peppery-linux-0.1.0-dev-amd64
```

O artefacto contém:

- imagem `.img.zst`;
- manifest de pacotes;
- checksum SHA-256;
- tabela de partições;
- log do teste QEMU.

## Descomprimir

```bash
unzstd peppery-linux-0.1.0-dev-amd64.img.zst
```

## Verificar integridade

```bash
sha256sum -c SHA256SUMS
```

## Testar localmente em QEMU

```bash
qemu-system-x86_64 \
  -m 4096 \
  -smp 4 \
  -enable-kvm \
  -drive file=peppery-linux-0.1.0-dev-amd64.img,format=raw
```

Se KVM não estiver disponível, remover `-enable-kvm`.

## Estado de validação

O teste automático em QEMU é um smoke test. Antes de classificar uma versão como Alpha, a imagem deverá também ser validada manualmente numa VM com ecrã gráfico, rede, desktop, reinício e encerramento.
