#setwd("/Users/claudiamgonzalez/Documents/INV/R/Repos-RG/")

# levanto las tablas que me envia Sandra el 30/12/2017
unlp_ris_rg <- read.csv2("Presencia_investigadores_UNLP_en_RG_y_RIS_parcial1.csv", header = TRUE, na.strings = "NA")

# Convierto el data.frame en tipo tibble
# library(tidyverse)
# unlp_ris_rg <- as_tibble(unlp_ris_rg) #cambió a tibble..

# Veo de generar el MCA. 
library(FactoMineR)
library(ggplot2)
library(factoextra)

# Selecciono las variables que entrarán - ocho categoricas
unlp_ris_rg.active <- unlp_ris_rg[1:968, 1:6]
head(unlp_ris_rg.active[, 1:6], 968)
summary(unlp_ris_rg.active)
MCA(unlp_ris_rg.active, ncp = 3, graph = TRUE)
res.mca <- MCA(unlp_ris_rg.active, graph = FALSE)
fviz_mca_biplot(res.mca, 
                repel = TRUE, # Avoid text overlapping (slow if many point)
                ggtheme = theme_minimal())
