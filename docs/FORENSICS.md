# Peppery Digital Forensics

## Objetivo

O perfil forense do Peppery Linux foi criado para aprendizagem e laboratório de:

- aquisição de evidência;
- criação de imagens de discos;
- recuperação de ficheiros;
- análise de sistemas de ficheiros;
- análise de metadados;
- pesquisa por indicadores;
- análise de imagens e blobs;
- preservação de integridade.

## Ferramentas iniciais

| Área | Ferramenta |
| --- | --- |
| Filesystem | Sleuth Kit |
| Interface forense | Autopsy (pacote Ubuntu clássico) |
| Recuperação | TestDisk / PhotoRec |
| Imaging/recuperação | GNU ddrescue |
| File carving | Foremost |
| Metadados | ExifTool |
| Regras/IOC | YARA |
| Binários/firmware | Binwalk |

## Princípios

### Trabalhar sobre cópias
A evidência original deve ser preservada sempre que possível. A análise deve ser feita sobre uma cópia de trabalho.

### Integridade
Calcular e registar hashes antes e depois das operações relevantes.

### Cadeia de custódia
Futuras versões do Peppery terão comandos próprios para:
- criar casos;
- registar evidência;
- calcular hashes;
- guardar logs;
- produzir relatórios.

## Estrutura futura de casos

```text
cases/
└── caso-001/
    ├── evidence/
    ├── images/
    ├── recovered/
    ├── memory/
    ├── network/
    ├── hashes/
    ├── logs/
    ├── reports/
    └── chain-of-custody/
```

## Próxima evolução

Está planeado um utilitário `peppery-forensic` para automatizar a gestão de casos e preservar um registo técnico reproduzível.
