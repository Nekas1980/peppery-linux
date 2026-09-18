# Peppery Linux

**Peppery Linux** é uma distribuição Linux em desenvolvimento baseada em **Ubuntu 26.04 LTS (Resolute Raccoon)**, orientada para três áreas principais:

1. **Programação e bases de dados**
2. **Forense digital**
3. **Cibersegurança, SOC e laboratório de pentesting autorizado**

A ideia é construir uma workstation técnica própria, reproduzível e modular, sem transformar a base Ubuntu numa cópia instável do Kali Linux.

## Base técnica

- Base: Ubuntu 26.04 LTS
- Arquitetura inicial: amd64
- Ambiente gráfico: Ubuntu Desktop Minimal
- Motor de imagem: Canonical `ubuntu-image`
- Formato inicial: imagem bootável `.img`
- Futuro: ISO Live/Installer Peppery
- Estado: `0.1.0-dev`

## Arquitetura funcional

```text
Peppery Linux
├── Core
├── Dev
├── Data
├── Digital Forensics
├── SOC / Network Analysis
└── Pentest Lab (opcional)
```

### Core
Base de sistema, rede, SSH, firewall e utilitários.

### Dev
Python, Node.js, Git, compilação e ferramentas de desenvolvimento.

### Data
PostgreSQL, MariaDB e SQLite.

### Digital Forensics
Sleuth Kit, Autopsy, TestDisk/PhotoRec, GNU ddrescue, Foremost, ExifTool, YARA e Binwalk.

### SOC / Network Analysis
Wireshark, tshark, tcpdump, Nmap, Suricata, auditd e futura integração Wazuh.

### Pentest Lab
Perfil opcional para ambientes de formação e testes autorizados, com Nmap, Hydra, John the Ripper, Hashcat, SQLMap, Nikto e Gobuster.

## Estrutura do repositório

```text
peppery-linux/
├── .github/workflows/
├── config/
│   └── branding/
├── docs/
│   ├── ARCHITECTURE.md
│   ├── FORENSICS.md
│   ├── ROADMAP.md
│   └── SECURITY_LAB.md
├── image-definitions/
│   └── peppery-amd64.yaml
├── profiles/
│   ├── core.list
│   ├── dev.list
│   ├── data.list
│   ├── forensics.list
│   ├── soc.list
│   └── pentest.list
├── scripts/
│   ├── bootstrap-host.sh
│   ├── build.sh
│   ├── check.sh
│   └── peppery-profile.sh
├── Makefile
├── README.md
└── VERSION
```

## Preparar uma máquina Ubuntu

```bash
git clone https://github.com/Nekas1980/peppery-linux.git
cd peppery-linux
sudo bash scripts/bootstrap-host.sh
```

## Validar o projeto

```bash
make check
```

## Construir a imagem

```bash
make build
```

Os artefactos são colocados em:

```text
build/out/
```

## Perfis Peppery

Listar:

```bash
make profiles
```

Ver um perfil:

```bash
make profile-show PROFILE=forensics
```

Instalar:

```bash
make profile-install PROFILE=forensics
```

Ou diretamente:

```bash
sudo bash scripts/peppery-profile.sh install dev data forensics soc
```

O perfil `pentest` é opcional e não faz parte da instalação base.

## Política Kali / Ubuntu

Peppery Linux **não mistura os repositórios Kali com os repositórios Ubuntu**.

Ferramentas normalmente associadas ao Kali podem ser incluídas no Peppery quando exista uma origem compatível e controlada.

Prioridade:

1. repositório oficial Ubuntu;
2. fonte oficial do projeto;
3. pacote oficial assinado;
4. container/virtualenv;
5. compilação documentada a partir do código-fonte.

## Forense digital

A vertente forense terá prioridade no desenvolvimento do Peppery.

Está prevista a criação de um utilitário próprio:

```text
peppery-forensic
```

para gestão de casos, evidência, hashes, logs, cadeia de custódia e relatórios.

Consulta `docs/FORENSICS.md`.

## Wazuh e laboratório de segurança

O Peppery será preparado para integração com Wazuh, mantendo Kali como uma máquina de laboratório independente quando necessário.

```text
Peppery Linux ----\
                  >---- Wazuh Manager / Dashboard
Kali Lab --------/
Outros hosts ----/
```

Consulta `docs/SECURITY_LAB.md`.

## Segurança e utilização

As ferramentas de segurança destinam-se a:

- aprendizagem;
- administração;
- análise defensiva;
- sistemas próprios;
- CTFs e laboratórios;
- ambientes com autorização explícita.

Não devem ser guardados no repositório passwords, tokens, chaves privadas ou outras credenciais.

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

## Roadmap

Consulta `docs/ROADMAP.md`.

## Versão

`0.1.0-dev`
