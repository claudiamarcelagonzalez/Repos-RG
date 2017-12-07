#setwd("/Users/claudiamgonzalez/Documents/INV/R/Repos-RG/")

# levanto las tablas que me envia Sandra el 30/12/2017
unlp_ris_rg <- read.csv2("Presencia_investigadores_UNLP_en_RG_y_RIS.csv", header = TRUE, na.strings = "NA")

# Convierto el data.frame en tipo tibble
# library(tidyverse)
# unlp_ris_rg <- as_tibble(unlp_ris_rg) #cambió a tibble..

# Veo de generar el MCA. 
library(FactoMineR)
library(ggplot2)
library(factoextra)

# Selecciono las variables que entrarán - siete
unlp_ris_rg.active <- unlp_ris_rg[2:705, c("Categoria", "Facultad", "Sexo", "ResearchGate", "SEDICI", "Memoria", "Naturalis")]
head(unlp_ris_rg.active[, c("Categoria", "Facultad", "Sexo", "ResearchGate", "SEDICI", "Memoria", "Naturalis")], 706)
summary(unlp_ris_rg.active)
res.mca <- MCA(unlp_ris_rg.active, ncp = 2, ind.sup = NULL, quanti.sup = NULL, 
               quali.sup = NULL, excl=NULL, graph = TRUE, 
               axes = c(1,2), method="Indicator", na.method="NA")
# fviz_mca_biplot(res.mca, repel = TRUE, ggtheme = theme_minimal())
