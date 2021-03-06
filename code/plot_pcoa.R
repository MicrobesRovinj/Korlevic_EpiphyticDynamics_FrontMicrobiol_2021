#################################################################################################################
# plot_pcoa.R
# 
# A script to generate the PCoA figure.
# Dependencies: results/numerical/rarefied.Rdata
#               data/raw/metadata.csv
# Produces: results/figures/pcoa_figure.jpg
#
#################################################################################################################

# Loading rarefied community data created during the generation of the richness and diversity calculators plot
load(file="results/numerical/rarefied.Rdata")

# Loading metadata 
metadata <- read_tsv("data/raw/metadata.csv")

# Joining metadata and point coordinates
rarefied_metadata <- inner_join(metadata, rarefied, by=c("ID"="Group"))

# Function for setting the number of decimal places
scaleFUN <- function(x) sprintf("%.2f", x)

# Generating a common theme for plots
theme <- theme(text=element_text(family="Times"), line=element_line(color="black"),
         panel.border=element_rect(fill=NA), panel.background=element_blank(),
         panel.grid=element_blank(), axis.line=element_blank(),
         axis.text=element_text(size=12, color="black"), axis.title=element_text(size=14, color="black"),
         plot.margin=unit(c(5.5, 16.5, 16.5, 16.5), "pt"),
         legend.text=element_text(size=10, margin=margin(r=0.2, unit="cm")), 
         legend.key.width=unit(0, "cm"), legend.key.height=unit(0.5, "cm"),
         legend.key=element_rect(fill="white"), legend.text.align=0, 
         legend.margin=margin(-5, 0, 0, 0), legend.position=c(0.01, 0.99),
         legend.justification=c("left", "top"), plot.title=element_text(size=14, hjust=0.5))

# Plots generation
# All samples
rarefied_metadata_select <- rarefied_metadata

# Generation of PCoA data
spe.bray <- vegdist(select(rarefied_metadata_select, starts_with("Otu")))
spe.b.pcoa <- cmdscale(spe.bray, k=(nrow(rarefied_metadata_select)-1), eig=TRUE)
coordinates <- spe.b.pcoa$points[,1:2] %>%
  as_tibble(.name_repair= ~c("A1", "A2")) %>%
  add_column("Group"=rarefied_metadata_select$label, .before=TRUE)
coordinates <- inner_join(metadata, coordinates, by=c("label"="Group"))

# PCoA plot generation
p1 <- ggplot() +
  geom_point(data=coordinates, aes(x=A1, y=A2, fill=station), shape=21, size=3, stroke=0.5) +
  scale_fill_manual(name=NULL,
                      values=c("F"="#1F78B4", "FCyM"="#666666", "FCaM"="#FDBF6F", "FCa"="#FF7F00"),
                      breaks=c("F", "FCyM", "FCaM", "FCa"),
                      labels=c("Seawater",
                               parse(text="italic('Cymodocea nodosa')~'(Mixed)'"),
                               parse(text="italic('Caulerpa cylindracea')~'(Mixed)'"),
                               parse(text="italic('Caulerpa cylindracea')~'(Monospecific)'"))) +
  labs(x=paste0("PCoA I (",format(round(spe.b.pcoa$eig[1]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)"), 
       y=paste0("PCoA II (",format(round(spe.b.pcoa$eig[2]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)")) +
  ggtitle(parse(text="bold('Seawater and Epiphytes')")) +
  scale_x_continuous(labels=scaleFUN) +
  scale_y_continuous(labels=scaleFUN) +
  theme

# Cymodocea nodosa samples
rarefied_metadata_select <- filter(rarefied_metadata, station=="FCyM") %>%
  select(!where(is.numeric) | where(~ is.numeric(.x) && sum(.x)!=0))

# Generation of PCoA data
spe.bray <- vegdist(select(rarefied_metadata_select, starts_with("Otu")))
spe.b.pcoa <- cmdscale(spe.bray, k=(nrow(rarefied_metadata_select)-1), eig=TRUE)
coordinates <- spe.b.pcoa$points[,1:2] %>%
  as_tibble(.name_repair= ~c("A1", "A2")) %>%
  add_column("Group"=rarefied_metadata_select$label, .before=TRUE)
coordinates <- inner_join(metadata, coordinates, by=c("label"="Group"))

# PCoA plot generation
p2 <- ggplot() +
  geom_point(data=coordinates, aes(x=A1, y=A2, fill=season), shape=21, size=3, stroke=0.5) +
  scale_fill_manual(name=NULL,
                    breaks=c("Spring", "Summer", "Autumn", "Winter"),
                    values=c("Spring"="#1F78B4", "Summer"="#666666", "Autumn"="#FDBF6F", "Winter"="#FF7F00")) +
  labs(x=paste0("PCoA I (",format(round(spe.b.pcoa$eig[1]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)"), 
       y=paste0("PCoA II (",format(round(spe.b.pcoa$eig[2]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)")) +
  ggtitle(parse(text="bolditalic('Cymodocea nodosa')~bold('(Mixed)')")) +
  scale_x_continuous(labels=scaleFUN) +
  scale_y_continuous(labels=scaleFUN) +
  theme

# Caulerpa cylindracea samples
rarefied_metadata_select <- filter(rarefied_metadata, str_detect(station, "^FCa")) %>%
  select(!where(is.numeric) | where(~ is.numeric(.x) && sum(.x)!=0))

# Generation of PCoA data
spe.bray <- vegdist(select(rarefied_metadata_select, starts_with("Otu")))
spe.b.pcoa <- cmdscale(spe.bray, k=(nrow(rarefied_metadata_select)-1), eig=TRUE)
coordinates <- spe.b.pcoa$points[,1:2] %>%
  as_tibble(.name_repair= ~c("A1", "A2")) %>%
  add_column("Group"=rarefied_metadata_select$label, .before=TRUE)
coordinates <- inner_join(metadata, coordinates, by=c("label"="Group"))

# PCoA plot generation
p3 <- ggplot() +
  geom_point(data=coordinates, aes(x=A1, y=A2, fill=season, shape=station), size=3, stroke=0.5) +
  scale_fill_manual(name=NULL,
                    breaks=c("Spring", "Summer", "Autumn", "Winter"),
                    values=c("Spring"="#1F78B4", "Summer"="#666666", "Autumn"="#FDBF6F", "Winter"="#FF7F00")) +
  scale_shape_manual(name=NULL,
                     values=c("FCa"=21, "FCaM"=23),
                     breaks=c("FCaM", "FCa"),
                     labels=c(parse(text="italic('Caulerpa cylindracea')~'(Mixed)'"),
                              parse(text="italic('Caulerpa cylindracea')~'(Monospecific)'"))) +
  labs(x=paste0("PCoA I (",format(round(spe.b.pcoa$eig[1]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)"), 
       y=paste0("PCoA II (",format(round(spe.b.pcoa$eig[2]/sum(spe.b.pcoa$eig)*100, digits=2), nsmall=2)," %)")) +
  ggtitle(parse(text="bolditalic('Caulerpa cylindracea')~bold('(Mixed and Monospecific)')")) +
  scale_x_continuous(labels=scaleFUN) +
  scale_y_continuous(labels=scaleFUN) +
  theme +
  theme(legend.position=c(0.01, 0.01), legend.justification=c("left", "bottom"),
        legend.spacing.y=unit(0.1, "cm")) +
  guides(fill=guide_legend(override.aes=list(shape=21)))

# Combining plots together and save
p <- cowplot::plot_grid(p1, p2, p3, ncol=1, align="h")
ggsave("results/figures/pcoa_figure.jpg", p, width=170, height=357, units="mm")