# Peppery Linux

**Peppery Linux** é uma distribuição Linux em desenvolvimento baseada em **Ubuntu 26.04 LTS (Resolute Raccoon)**.

O projeto tem como objetivo criar uma distribuição própria, reproduzível e documentada para desktop, desenvolvimento, administração de sistemas e laboratório de cibersegurança defensiva.

## Base técnica

- Base: Ubuntu 26.04 LTS
- Arquitetura inicial: amd64
- Ambiente gráfico: Ubuntu Desktop Minimal
- Motor de imagem: Canonical `ubuntu-image`
- Formato inicial: imagem de disco bootável `.img`
- Futuro: ISO Live/Installer Peppery
- Estado: `0.1.0-dev`

## Objetivos

1. Construir uma imagem Ubuntu personalizada e reproduzível.
2. Adicionar identidade própria Peppery Linux.
3. Criar perfis Desktop, Developer e Security Lab.
4. Automatizar validações no GitHub.
5. Testar em máquina virtual antes de instalar em hardware real.
6. Evoluir para ISO Live/Installer.
7. Publicar releases e documentação técnica.

## Estrutura

```text
peppery-linux/
├── .github/workflows/
│   └── lint.yml
├── config/
│   └── branding/
│       └── etc/
│           └── peppery-release
├── docs/
│   ├── ARCHITECTURE.md
│   └── ROADMAP.md
├── image-definitions/
│   └── peppery-amd64.yaml
├── scripts/
│   ├── bootstrap-host.sh
│   ├── build.sh
│   └── check.sh
├── .gitignore
├── Makefile
├── README.md
└── VERSION
```

## Preparar uma máquina Ubuntu

Recomendado: máquina virtual ou computador com Ubuntu e pelo menos 25–30 GB livres.

```bash
git clone https://github.com/Nekas1980/peppery-linux.git
cd peppery-linux
sudo bash scripts/bootstrap-host.sh
```

## Validar o projeto

```bash
make check
```

## Construir Peppery Linux

```bash
make build
```

O build usa:

```bash
sudo ubuntu-image --workdir=build/work --output-dir=build/out \
  classic image-definitions/peppery-amd64.yaml
```

Os artefactos são colocados em:

```text
build/out/
```

## Pacotes iniciais

A imagem inclui uma base Ubuntu e acrescenta, entre outros:

- `ubuntu-desktop-minimal`
- `network-manager`
- `git`
- `curl`
- `vim`
- `nano`
- `htop`
- `ufw`
- `openssh-client`
- `python3`
- `python3-pip`
- `build-essential`

## Segurança

O perfil de cibersegurança será construído por módulos. As ferramentas incluídas destinam-se a administração, diagnóstico, formação e laboratórios autorizados.

Não serão guardadas palavras-passe, tokens, chaves privadas ou credenciais no repositório.

## Desenvolvimento

Antes de cada alteração:

```bash
make check
git status
```

Depois:

```bash
git add .
git commit -m "descricao da alteracao"
git push
```

## Próximos marcos

Consulta `docs/ROADMAP.md`.

## Versão

`0.1.0-dev`
