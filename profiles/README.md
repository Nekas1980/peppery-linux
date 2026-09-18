# Perfis Peppery Linux

Os perfis permitem acrescentar capacidades ao Peppery Linux sem instalar todas as ferramentas por defeito.

## Perfis

### core
Ferramentas essenciais de sistema e administração.

### dev
Programação, compilação, Git, Python e Node.js.

### data
PostgreSQL, MariaDB e SQLite.

### forensics
Aquisição, recuperação e análise forense de ficheiros, volumes, metadados e imagens.

Inclui inicialmente:
- Sleuth Kit;
- Autopsy do repositório Ubuntu;
- TestDisk/PhotoRec;
- GNU ddrescue;
- Foremost;
- ExifTool;
- YARA;
- Binwalk.

> Nota: o pacote `autopsy` disponível nos repositórios Ubuntu é a linha clássica 2.x. A integração de uma versão moderna do Autopsy será tratada separadamente numa fase posterior, sem substituir pacotes do sistema de forma insegura.

### soc
Análise de rede, captura de tráfego, IDS e auditoria.

### pentest
Ferramentas de laboratório para testes de segurança autorizados.

Este perfil não é instalado por defeito. Deve ser utilizado apenas em sistemas, redes e aplicações para os quais exista autorização.

## Utilização

Listar perfis:

```bash
sudo bash scripts/peppery-profile.sh list
```

Instalar um perfil:

```bash
sudo bash scripts/peppery-profile.sh install forensics
```

Instalar vários:

```bash
sudo bash scripts/peppery-profile.sh install dev data forensics soc
```

Ver pacotes de um perfil:

```bash
bash scripts/peppery-profile.sh show forensics
```

## Política de repositórios

Peppery Linux não adiciona repositórios Kali ao Ubuntu.

Prioridade de origem de software:

1. repositórios oficiais Ubuntu;
2. repositório oficial do fabricante/projeto;
3. pacote oficial assinado;
4. ambiente isolado como container ou virtualenv;
5. compilação documentada a partir do código-fonte.

Esta política reduz conflitos de dependências e facilita atualizações futuras.
