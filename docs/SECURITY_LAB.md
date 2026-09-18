# Peppery Security Lab

## Objetivo

O Security Lab reúne ferramentas para aprendizagem de defesa, monitorização, análise de rede e testes de segurança autorizados.

## Separação de funções

### Peppery SOC
Focado em:
- Wireshark/tshark;
- tcpdump;
- Nmap para descoberta e inventário;
- Suricata;
- auditd;
- análise de logs;
- futura integração Wazuh.

### Peppery Pentest
Perfil opcional de laboratório com ferramentas como:
- Nmap;
- Hydra;
- John the Ripper;
- Hashcat;
- SQLMap;
- Nikto;
- Gobuster.

## Relação com Kali

Kali Linux continua a poder existir como máquina de laboratório separada.

Peppery Linux não adiciona os repositórios Kali à base Ubuntu. Esta decisão reduz:
- conflitos de dependências;
- atualizações quebradas;
- mistura de políticas de empacotamento;
- dificuldade de suporte.

Quando uma ferramenta não existir no Ubuntu, será integrada através de uma fonte oficial e documentada ou executada num ambiente isolado.

## Wazuh

A integração com Wazuh será implementada em fase própria.

Arquitetura prevista:

```text
Peppery Linux ----\
                  >---- Wazuh Manager / Dashboard
Kali Lab --------/
Outros hosts ----/
```

O objetivo é permitir que o Peppery funcione simultaneamente como:
- workstation técnica;
- endpoint monitorizado;
- estação de análise;
- ambiente de laboratório.

## Regra de utilização

Ferramentas de pentesting destinam-se exclusivamente a formação, sistemas próprios e ambientes com autorização explícita.
