# Analyse des Mutations ADN 🧬

![R](https://img.shields.io/badge/R-4.4.2-blue)
![License](https://img.shields.io/badge/License-CC0-lightgrey)

---

## Description
Ce projet est un pipeline d'analyse de mutations dans un gène spécifique à partir de séquences ADN de patients.  
Il permet d'identifier les variants et de visualiser leur fréquence par position dans les séquences.

Le projet est développé en **R** et utilise les packages suivants :  

- `Biostrings` pour la manipulation de séquences ADN  
- `dplyr` pour le traitement des données  
- `ggplot2` pour la visualisation  

---

## Structure du projet

Mutation_Projet/
│
├─ data/ # Fichiers FASTA des séquences (ex: sequences.fasta)
|

├─ results/ # Sorties générées par le script (CSV et graphiques)
|

├─ scripts/ # Scripts R

 └─ analyse_mutations.R




---

## Installation des dépendances

Ouvrir R ou RStudio et exécuter :

```r
# Installer BiocManager si nécessaire
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Installer Biostrings
if (!requireNamespace("Biostrings", quietly = TRUE)) {
  BiocManager::install("Biostrings")
}

# Installer ggplot2 et dplyr
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
Utilisation
Placer le fichier FASTA des séquences dans le dossier data/.

Exécuter le script principal :

bash
Copier le code
cd scripts
Rscript analyse_mutations.R
Le script produira :

results/mutation_frequencies.csv : fréquence des nucléotides les plus courants par position.

results/mutation_frequencies.png : graphique des fréquences par position.

Exemple de données
Fichier sequences.fasta (10 séquences fictives) :

shell
Copier le code
>seq1
ATGCGTACGTAG
>seq2
ATGCGTACGTAG
>seq3
ATGCGTACGTAG
...
Démonstration rapide (VS Code / RStudio)
Ouvrir le projet dans VS Code ou RStudio.

Vérifier que les packages sont installés.

Lancer le script :

r
Copier le code
source("scripts/analyse_mutations.R")
Vérifier le dossier results/ pour le CSV et le graphique.

Améliorations possibles
Calculer la fréquence de chaque nucléotide au lieu de seulement le plus courant.

Identifier et annoter les mutations spécifiques (SNPs) par rapport à une séquence de référence.

Ajouter des analyses statistiques pour comparer différents patients.

Générer des graphiques plus détaillés (heatmaps, logos de séquence, etc.).

Licence
Projet libre à des fins éducatives et scientifiques (CC0 / Domaine public).
```
 <img width="1052" height="493" alt="Screenshot 2025-11-07 143911" src="https://github.com/user-attachments/assets/6babe2c5-aa3c-468b-9b19-c4804974243b" />
