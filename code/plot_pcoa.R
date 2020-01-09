#################################################################################################################
# plot_pcoa.R
# 
# A script to generate the PCoA figure.
# Dependencies: data/mothur/raw.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti_mcc.shared
#               data/raw/metadata.csv
# Produces: results/figures/pcoa_figure.jpg
#
#################################################################################################################

# Loading OTU/sample data
shared <- read_tsv("data/mothur/raw.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti_mcc.shared")

# Generation of random rarified community data
rarefied <- shared %>%
  select(-label, -Group, -numOtus) %>%
  rrarefy(., min(rowSums(.))) %>%
  as.tibble() %>%
  add_column("Group"=shared$Group, .before=TRUE)

# Loading metadata 
metadata <- read_tsv("data/raw/metadata.csv")

# Joining metadata and point coordiantes
rarefied_metadata <- inner_join(metadata, rarefied, by=c("ID"="Group"))

########################################
# All samples
########################################

# Filter all sampels
rarefied_metadata_select <- rarefied_metadata

# Generation of PCoA data
spe.bray <- vegdist(select(rarefied_metadata_select, starts_with("Otu")))
spe.b.pcoa <- cmdscale(spe.bray, k=(nrow(rarefied_metadata_select)-1), eig=TRUE)
coordinates <- spe.b.pcoa$points[,1:2] %>%
  as.tibble() %>%
  add_column("Group"=rarefied_metadata_select$label, .before=TRUE)

# PCoA plot generation
p1 <- ggplot(coordinates, aes(x=V1, y=V2, label=Group)) +
  geom_point() +
  geom_text(aes(label=Group), nudge_x=0.07) +
  labs(x=paste0("PCoA I (",format(round(spe.b.pcoa$eig[1]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)"), 
       y=paste0("PCoA II (",format(round(spe.b.pcoa$eig[2]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)")) +
  theme(text=element_text(family="Times"), line=element_line(color="black"),
        panel.border=element_rect(fill=NA), panel.background=element_blank(),
        panel.grid=element_blank(), axis.line=element_blank(),
        axis.text=element_text(size=14, color="black"), axis.title=element_text(size=18, color="black"),
        plot.margin = unit(c(22, 22, 22, 22), "pt"))

########################################
# Water column samples
########################################

# Filter samples from the water column
rarefied_metadata_select <- filter(rarefied_metadata, station=="F")

# Generation of PCoA data
spe.bray <- vegdist(select(rarefied_metadata_select, starts_with("Otu")))
spe.b.pcoa <- cmdscale(spe.bray, k=(nrow(rarefied_metadata_select)-1), eig=TRUE)
coordinates <- spe.b.pcoa$points[,1:2] %>%
  as.tibble() %>%
  add_column("Group"=rarefied_metadata_select$label, .before=TRUE)

# PCoA plot generation
p2 <- ggplot(coordinates, aes(x=V1, y=V2, label=Group)) +
  geom_point() +
  geom_text(aes(label=Group), nudge_x=0.07) +
  labs(x=paste0("PCoA I (",format(round(spe.b.pcoa$eig[1]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)"), 
       y=paste0("PCoA II (",format(round(spe.b.pcoa$eig[2]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)")) +
  theme(text=element_text(family="Times"), line=element_line(color="black"),
        panel.border=element_rect(fill=NA), panel.background=element_blank(),
        panel.grid=element_blank(), axis.line=element_blank(),
        axis.text=element_text(size=14, color="black"), axis.title=element_text(size=18, color="black"),
        plot.margin = unit(c(22, 22, 22, 22), "pt"))

########################################
# Cymodocea nodosa samples
########################################

# Filter samples from the water column
rarefied_metadata_select <- filter(rarefied_metadata, station=="FCyM")

# Generation of PCoA data
spe.bray <- vegdist(select(rarefied_metadata_select, starts_with("Otu")))
spe.b.pcoa <- cmdscale(spe.bray, k=(nrow(rarefied_metadata_select)-1), eig=TRUE)
coordinates <- spe.b.pcoa$points[,1:2] %>%
  as.tibble() %>%
  add_column("Group"=rarefied_metadata_select$label, .before=TRUE)

# PCoA plot generation
p3 <- ggplot(coordinates, aes(x=V1, y=V2, label=Group)) +
  geom_point() +
  geom_text(aes(label=Group), nudge_x=0.07) +
  labs(x=paste0("PCoA I (",format(round(spe.b.pcoa$eig[1]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)"), 
       y=paste0("PCoA II (",format(round(spe.b.pcoa$eig[2]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)")) +
  theme(text=element_text(family="Times"), line=element_line(color="black"),
        panel.border=element_rect(fill=NA), panel.background=element_blank(),
        panel.grid=element_blank(), axis.line=element_blank(),
        axis.text=element_text(size=14, color="black"), axis.title=element_text(size=18, color="black"),
        plot.margin = unit(c(22, 22, 22, 22), "pt"))

########################################
# Caulerpa cylindracea samples
########################################

# Filter samples from the water column
rarefied_metadata_select <- filter(rarefied_metadata, str_detect(station, "^FCa"))

# Generation of PCoA data
spe.bray <- vegdist(select(rarefied_metadata_select, starts_with("Otu")))
spe.b.pcoa <- cmdscale(spe.bray, k=(nrow(rarefied_metadata_select)-1), eig=TRUE)
coordinates <- spe.b.pcoa$points[,1:2] %>%
  as.tibble() %>%
  add_column("Group"=rarefied_metadata_select$label, .before=TRUE)

# PCoA plot generation
p4 <- ggplot(coordinates, aes(x=V1, y=V2, label=Group)) +
  geom_point() +
  geom_text(aes(label=Group), nudge_x=0.07) +
  labs(x=paste0("PCoA I (",format(round(spe.b.pcoa$eig[1]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)"), 
       y=paste0("PCoA II (",format(round(spe.b.pcoa$eig[2]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)")) +
  theme(text=element_text(family="Times"), line=element_line(color="black"),
        panel.border=element_rect(fill=NA), panel.background=element_blank(),
        panel.grid=element_blank(), axis.line=element_blank(),
        axis.text=element_text(size=14, color="black"), axis.title=element_text(size=18, color="black"),
        plot.margin = unit(c(22, 22, 22, 22), "pt"))

# Combining plots together and save
p <- grid.arrange(p1, p2, p3, p4, nrow=2, ncol=2)
ggsave("results/figures/pcoa_figure.jpg", p, width=297, height=210, units="mm")
