# Roadmap — Peppery Linux

## Fase 0 — Bootstrap

- [x] Criar repositório.
- [x] Definir Ubuntu como base.
- [x] Definir Ubuntu 26.04 LTS / Resolute.
- [x] Criar estrutura inicial.
- [x] Adicionar definição `ubuntu-image`.
- [x] Adicionar scripts de build e validação.
- [x] Adicionar CI inicial.

## Fase 1 — Perfis técnicos

- [x] Criar perfil Core.
- [x] Criar perfil Dev.
- [x] Criar perfil Data.
- [x] Criar perfil Forensics.
- [x] Criar perfil SOC.
- [x] Criar perfil Pentest opcional.
- [x] Criar gestor `peppery-profile.sh`.
- [ ] Validar instalação de todos os perfis num Ubuntu 26.04 limpo.
- [ ] Registar versões testadas das ferramentas.

## Fase 2 — Primeira imagem bootável

- [ ] Executar `make check` num host Ubuntu.
- [ ] Executar o primeiro `make build`.
- [ ] Guardar manifest do build.
- [ ] Arrancar a imagem em QEMU/VirtualBox.
- [ ] Confirmar kernel, rede, systemd e desktop.
- [ ] Registar erros e correções.

## Fase 3 — Digital Forensics

- [x] Criar manifesto inicial de ferramentas forenses.
- [x] Documentar princípios de aquisição e integridade.
- [ ] Criar `peppery-forensic`.
- [ ] Criar estrutura automática de casos.
- [ ] Implementar hashing SHA-256.
- [ ] Implementar registo de evidência.
- [ ] Implementar cadeia de custódia.
- [ ] Adicionar análise de memória com Volatility 3.
- [ ] Avaliar integração do Autopsy moderno.
- [ ] Criar exercícios e datasets de laboratório.
- [ ] Gerar relatório técnico de caso.

## Fase 4 — SOC / Blue Team

- [x] Criar perfil SOC inicial.
- [ ] Integrar Wazuh Agent.
- [ ] Documentar ligação a Wazuh Manager/Dashboard.
- [ ] Criar configuração Suricata Peppery.
- [ ] Criar laboratório de análise PCAP.
- [ ] Criar exercícios de logs e deteção.
- [ ] Avaliar Zeek para telemetria de rede.

## Fase 5 — Pentest Lab

- [x] Criar perfil opcional inicial.
- [ ] Validar ferramentas em ambiente isolado.
- [ ] Criar documentação de laboratório autorizado.
- [ ] Criar rede virtual Peppery + Kali + alvos.
- [ ] Criar CTFs locais.
- [ ] Separar ferramentas ofensivas avançadas da imagem base.

## Fase 6 — Programação e Dados

- [x] Criar perfis Dev e Data.
- [ ] Integrar ferramentas para PostgreSQL.
- [ ] Integrar ambiente de containers.
- [ ] Criar templates para projetos Python.
- [ ] Criar templates de bases de dados.
- [ ] Integrar projetos Peppery de demonstração.

## Fase 7 — Identidade Peppery

- [ ] Nome e versão apresentados no sistema.
- [ ] Wallpaper.
- [ ] Logótipo.
- [ ] Tema.
- [ ] Ecrã de login.
- [ ] Terminal de boas-vindas.
- [ ] Aplicação Peppery Control Center.
- [ ] Informação de suporte e versão.

## Fase 8 — Instalação

- [ ] Investigar imagem installer.
- [ ] Integrar Subiquity ou abordagem equivalente.
- [ ] Criar ISO Live.
- [ ] Instalação UEFI.
- [ ] Secure Boot.
- [ ] Particionamento.
- [ ] Criação segura de utilizador no primeiro arranque.

## Fase 9 — Qualidade

- [ ] Testes automáticos.
- [ ] Checksums.
- [ ] SBOM.
- [ ] Assinatura de releases.
- [ ] Política de vulnerabilidades.
- [ ] Guia de contribuição.
- [ ] Testes de atualização entre versões.

## Fase 10 — Release

- [ ] Alpha.
- [ ] Beta.
- [ ] Release Candidate.
- [ ] Peppery Linux 1.0.
