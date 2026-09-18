# Roadmap — Peppery Linux

## Fase 0 — Bootstrap

- [x] Criar repositório.
- [x] Definir Ubuntu como base.
- [x] Definir Ubuntu 26.04 LTS / Resolute.
- [x] Criar estrutura inicial.
- [x] Adicionar definição `ubuntu-image`.
- [x] Adicionar scripts de build e validação.
- [x] Adicionar CI inicial.

## Fase 1 — Primeira imagem bootável

- [ ] Executar `make check` num host Ubuntu.
- [ ] Executar o primeiro `make build`.
- [ ] Guardar manifest do build.
- [ ] Arrancar a imagem em QEMU/VirtualBox.
- [ ] Confirmar kernel, rede, systemd e desktop.
- [ ] Registar erros e correções.

## Fase 2 — Identidade Peppery

- [ ] Nome e versão apresentados no sistema.
- [ ] Wallpaper.
- [ ] Logótipo.
- [ ] Tema.
- [ ] Ecrã de login.
- [ ] Aplicação/terminal de boas-vindas.
- [ ] Informação de suporte e versão.

## Fase 3 — Perfis

### Desktop
- [ ] Utilização diária.
- [ ] Rede.
- [ ] Browser.
- [ ] Escritório.
- [ ] Multimédia essencial.

### Developer
- [ ] Git.
- [ ] Python.
- [ ] C/C++.
- [ ] Containers.
- [ ] Bases de dados.
- [ ] VS Code ou alternativa definida pelo projeto.

### Security Lab
- [ ] Diagnóstico de rede.
- [ ] Logs.
- [ ] Hardening.
- [ ] Monitorização.
- [ ] Forense e recuperação.
- [ ] Ferramentas ofensivas apenas em módulo de laboratório autorizado.

## Fase 4 — Instalação

- [ ] Investigar imagem installer.
- [ ] Integrar Subiquity ou abordagem equivalente.
- [ ] Criar ISO Live.
- [ ] Instalação UEFI.
- [ ] Secure Boot.
- [ ] Particionamento.
- [ ] Criação segura de utilizador no primeiro arranque.

## Fase 5 — Qualidade

- [ ] Testes automáticos.
- [ ] Checksums.
- [ ] SBOM.
- [ ] Assinatura de releases.
- [ ] Política de vulnerabilidades.
- [ ] Guia de contribuição.

## Fase 6 — Release

- [ ] Alpha.
- [ ] Beta.
- [ ] Release Candidate.
- [ ] Peppery Linux 1.0.
