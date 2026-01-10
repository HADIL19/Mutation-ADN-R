# -------------------------------
# Analyse des mutations ADN
# -------------------------------

# Charger les packages
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Installer Biostrings si nécessaire
if (!requireNamespace("Biostrings", quietly = TRUE)) {
  BiocManager::install("Biostrings")
}

# Installer ggplot2 et dplyr si nécessaire
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}

library(Biostrings)
library(dplyr)
library(ggplot2)

# Définir les chemins
fasta_file <- "../data/sequences.fasta"
output_dir <- "../results/"

if (!dir.exists(output_dir)) dir.create(output_dir)

# Lire les séquences ADN
sequences <- readDNAStringSet(fasta_file)

# Convertir en matrice (chaque ligne = séquence, chaque colonne = position)
seq_matrix <- as.matrix(sequences)

# Nombre de séquences et longueur
num_seq <- nrow(seq_matrix)
seq_length <- ncol(seq_matrix)

# Calculer les fréquences de chaque base par position
mutation_freq <- data.frame(
  Position = 1:seq_length,
  Frequency = apply(seq_matrix, 2, function(col) {
    # fréquence du nucléotide le plus courant à cette position
    max(table(col))
  })
)

print(mutation_freq)

# Sauvegarder les fréquences dans un CSV
csv_file <- paste0(output_dir, "mutation_frequencies.csv")
write.csv(mutation_freq, file = csv_file, row.names = FALSE)
cat("CSV sauvegardé dans :", csv_file, "\n")

# Générer un graphique des fréquences
plot_file <- paste0(output_dir, "mutation_frequencies.png")
p <- ggplot(mutation_freq, aes(x = Position, y = Frequency)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(
    title = "Fréquence des mutations par position",
    x = "Position dans la séquence",
    y = "Nombre de séquences"
  )

# Sauvegarder le graphique
ggsave(plot_file, plot = p, width = 7, height = 5)
cat("Graphique sauvegardé dans :", plot_file, "\n")

# Fin du script
