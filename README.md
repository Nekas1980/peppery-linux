# Peppery Linux

Peppery Linux é uma distribuição Linux experimental baseada em Debian, criada para aprendizagem, desenvolvimento, administração de sistemas e laboratório de cibersegurança.

## Objetivo

Construir uma distribuição própria, reproduzível e documentada, começando por uma ISO Live baseada em Debian e evoluindo para:

- ambiente gráfico XFCE;
- conjunto de ferramentas de administração e desenvolvimento;
- perfil opcional de cibersegurança defensiva;
- branding Peppery Linux;
- ISO Live/instalável;
- pipeline de validação no GitHub;
- documentação técnica para estudo e portefólio.

## Estado

**Fase 0 — bootstrap do projeto**

A base inicial usa `live-build`, a ferramenta oficial do ecossistema Debian para criar imagens Live.

## Requisitos de build

Recomendado: Debian/Ubuntu/WSL2 com pelo menos 20 GB livres.

```bash
sudo apt update
sudo apt install -y live-build debootstrap squashfs-tools xorriso isolinux syslinux-common
```

> Para gerar e testar uma ISO completa, o ideal é usar uma máquina virtual Linux ou um host Debian/Ubuntu. O WSL2 pode servir para desenvolvimento dos ficheiros do projeto, mas não é o ambiente mais fiável para todas as etapas de criação/teste de uma ISO bootável.

## Build rápido

```bash
git clone https://github.com/Nekas1980/peppery-linux.git
cd peppery-linux
bash scripts/configure.sh
sudo lb build
```

A imagem resultante deverá surgir na raiz do projeto, normalmente como `live-image-amd64.hybrid.iso`.

## Estrutura

```text
peppery-linux/
├── .github/workflows/       validações automáticas
├── config/
│   ├── hooks/               personalização executada durante o build
│   ├── includes.chroot/     ficheiros copiados para o sistema final
│   └── package-lists/       pacotes instalados na ISO
├── docs/                    arquitetura e roadmap
├── scripts/                 configuração, build e limpeza
├── Makefile
└── VERSION
```

## Comandos principais

```bash
make configure
make build
make clean
make distclean
make check
```

## Roadmap resumido

1. Gerar a primeira ISO Live.
2. Arrancar a ISO numa VM.
3. Aplicar branding Peppery.
4. Adicionar instalador.
5. Criar perfis Desktop, Developer e Security Lab.
6. Automatizar testes de build.
7. Publicar releases versionadas.

## Segurança

Ferramentas de segurança que venham a ser integradas neste projeto destinam-se a laboratórios autorizados, formação e administração defensiva.

## Versão inicial

`0.1.0-dev`
