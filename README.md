# normal-modes-charmm-pipeline-with-rna
# Pipeline de Análise de Modos Normais

## 📌 Descrição

Este pipeline foi desenvolvido para realizar **Análise de Modos Normais (Normal Mode Analysis – NMA)** e análise de flutuações estruturais de proteínas utilizando o **CHARMM**, aplicado para proteína com RNA.

Adaptado do workflow desenvolvido por **David Perahia**, o pipeline automatiza as etapas de preparação, minimização de energia, cálculo dos modos normais e análise das flutuações estruturais, permitindo investigar os movimentos coletivos e a flexibilidade conformacional de sistemas biomoleculares.
  
---
## ⚙️ Requisitos

Os requisitos e dependências estão disponíveis em:

[Requirements](https://github.com/Labbiofisbiocomp/normal-modes-charmm-pipeline/blob/main/requirements.md)

---
# 📖 Sobre o projeto

Este pipeline foi desenvolvido para:

- realizar minimização de energia com restrições;
- calcular modos normais utilizando o CHARMM;
- analisar movimentos coletivos de proteínas;
- calcular flutuações estruturais (RMSF);
- gerar arquivos para análises estruturais posteriores.

---
# 📂 Estrutura do repositório

```text
├── requirements.md
├── mini-restraint.inp
├── ligdiag.inp
├── traj-diag.inp
├── fluct-mod.inp
├── README-en.md            
└── README.md
```

---

## 🔄 Visão geral do pipeline

```text
Estrutura inicial
        ↓
Minimização de energia com restrições
        ↓
Diagonalização da matriz Hessiana
        ↓
Geração dos modos normais
        ↓
Análise de flutuação atômica (RMSF)
```
---

## ▶️ Como executar

Execute os scripts na seguinte ordem:

```bash
charmm < mini-restraint.inp > mini-restraint.out
charmm < ligdiag.inp > ligdiag.out
charmm < traj-diag.inp > traj-diag.out
charmm < fluct-mod.inp > fluct-mod.out
```

---

## 📥 Inputs

* `step1_pdbreader.psf`  → Arquivo de topologia.
* `step1_pdbreader.crd` → Coordenadas iniciais da estrutura.

---

## 📤 Outputs

Ao final da execução são gerados:

- `min_restr.crd` contendo a estrutura minimizada;
- `modes.mod` contendo os modos normais calculados;
- `flut-@i.pdb` contendo os valores de flutuação estrutural (RMSF).

---

## 🧪 Estrutura dos arquivos

- `mini-restraint.inp` → Realiza a minimização de energia utilizando restrições estruturais.
- `ligdiag.inp` → Calcula e diagonaliza a matriz Hessiana.
- `traj-diag.inp` → Gera os modos normais da estrutura minimizada.
- `fluct-mod.inp` → Calcula as flutuações estruturais (RMSF) a partir dos modos normais.

---
## ⚠️ Observações importantes

* Os scripts devem ser executados na ordem apresentada.
* Certifique-se de que os arquivos `.psf` e `.crd` estejam corretamente preparados antes da execução.
* Verifique os arquivos de saída antes de prosseguir para etapas posteriores da análise.
* Dependendo do tamanho do sistema biomolecular, o tempo de processamento pode variar.

---

## 📌 Notas
Este pipeline foi adaptado do workflow desenvolvido por **David Perahia** para automatizar análises de Modos Normais utilizando o **CHARMM**.
