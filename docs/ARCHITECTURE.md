# Arquitetura do Peppery Linux

## 1. Base

Peppery Linux parte do Ubuntu 26.04 LTS (Resolute), inicialmente para amd64.

A distribuição não pretende criar um kernel novo. A primeira fase constrói uma distribuição derivada, utilizando o kernel e os repositórios Ubuntu e adicionando configuração, pacotes, identidade e componentes Peppery.

## 2. Estratégia de imagem

O projeto utiliza `ubuntu-image classic` para gerar uma imagem clássica bootável.

A definição principal encontra-se em:

`image-definitions/peppery-amd64.yaml`

## 3. Camadas

### Ubuntu Base

Responsável por kernel, boot, apt, systemd, drivers e componentes fundamentais.

### Peppery Core

Responsável por identidade, configuração base, políticas e ferramentas comuns.

### Desktop

Baseado inicialmente em `ubuntu-desktop-minimal`.

### Developer

Git, compiladores, Python e ferramentas de desenvolvimento.

### Security Lab

Será mantido como perfil separado, com ferramentas de administração, observabilidade, hardening e análise de segurança para ambientes autorizados.

## 4. Segurança do projeto

O repositório não deve conter:

- passwords;
- tokens;
- chaves SSH privadas;
- certificados privados;
- credenciais de cloud;
- ficheiros `.env` reais.

## 5. Ciclo de desenvolvimento

1. Alterar código/configuração.
2. Executar `make check`.
3. Construir imagem.
4. Testar exclusivamente numa VM.
5. Documentar resultado.
6. Só depois considerar hardware físico.

## 6. Objetivo futuro

A arquitetura deverá evoluir de uma imagem preinstalled para uma experiência completa de distribuição:

- ISO Live;
- instalador;
- identidade visual Peppery;
- atualização e rollback;
- perfis instaláveis;
- testes automáticos;
- releases assinadas.
