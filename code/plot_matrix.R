#################################################################################################################
# code/plot_matrix.R
# 
# A script to plot a matrix of similarity indices.
# Dependencies: results/numerical/rarefied.Rdata
#               data/raw/metadata.csv
# Produces: results/figures/matrix.jpg
#
#################################################################################################################

# Loading rarefied community data created during the generation of the richness and diversity calculators plot
load(file="results/numerical/rarefied.Rdata")

# Loading metadata 
metadata <- read_tsv("data/raw/metadata.csv")

# Joining metadata with OTU/sample data and summing sequences from each environment
rarefied_metadata <- inner_join(rarefied, metadata, by=c("Group"="ID")) %>%
  mutate(date=as.Date(date, "%d.%m.%Y")) %>%
  filter(date >= "2017-11-01") %>%
  select(!where(is.numeric) | where(~is.numeric(.x) && sum(.x)!=0)) %>%
  group_by(station) %>%
  summarise(across(starts_with("Otu"), sum), .groups="drop")

# Copying the sample labels to the rows (input for library vegan)
rarefied_metadata <- rarefied_metadata %>%
  column_to_rownames("station")

# Calculating matrices of similarity indices
jaccard <- as.matrix(vegdist(rarefied_metadata, method="jaccard", binary=T))
jaccard[lower.tri(jaccard, diag=TRUE)] <- NA
jaccard <- as_tibble(jaccard) %>%
  add_column("V1"=rownames(jaccard), .before=TRUE) %>%
  gather(key="V2", value="jaccard", 2:ncol(.)) %>%
  filter(!is.na(jaccard))

bray <- as.matrix(vegdist(rarefied_metadata, method="bray", binary=F))
bray[lower.tri(bray, diag=TRUE)] <- NA
bray <- as_tibble(bray) %>%
  add_column("V1"=rownames(bray), .before=TRUE) %>%
  gather(key="V2", value="bray", 2:ncol(.)) %>%
  filter(!is.na(bray))

similarity <- inner_join(jaccard, bray, by=c("V1"="V1", "V2"="V2")) %>%
  mutate(jaccard=1-jaccard) %>%
  mutate(bray=1-bray)

# Arrange factors for plotting
similarity$V1 <- factor(similarity$V1, levels=c("F", "FCyM", "FCa", "FCaM"))
similarity$V2 <- factor(similarity$V2, levels=c("FCyM", "FCaM", "FCa"))

# Function for setting the number of decimal places
scaleFUN <- function(x) sprintf("%.2f", x)

# Generate a common theme
theme <- theme(text=element_text(family="Times"), line=element_line(color="black"),
         panel.grid=element_blank(),
         axis.line.x=element_blank(), axis.line.y=element_blank(),
         axis.ticks.x=element_blank(), axis.ticks.y.left=element_blank(),
         axis.text.y=element_text(size=15, color="black", hjust=0.5, vjust=0.5, margin=margin(r=-0.2, unit="cm")),
         axis.text.x=element_text(size=15, color="black", hjust=0.5, vjust=0.5, margin=margin(t=-0.2, unit="cm")),
         panel.background=element_blank(), plot.margin=unit(c(5.5, 5.5, 5.5, 5.5), "pt"),
         legend.position="none", plot.title=element_text(face="bold", size=20))

# Plot generation
group_name <- c("F"=expression(bold("Seawater")),
                "FCyM"=expression(atop(bolditalic("Cymodocea nodosa"), bold("(Mixed)"))),
                "FCaM"=expression(atop(bolditalic("Caulerpa cylindracea"), bold("(Mixed)"))),
                "FCa"=expression(atop(bolditalic("Caulerpa cylindracea"), bold("(Monospecific)"))))

jaccard <- ggplot(similarity, aes(x=V2, y=V1, fill=jaccard)) + 
  geom_tile(colour="black", size=0.5) +
  geom_text(aes(V2, V1, label=scaleFUN(jaccard)), color="black", size=7, family="Times", fontface="bold") +
  labs(x=NULL, y=NULL) +
  ggtitle("Jaccard's Similarity Coefficient") +
  scale_fill_gradient2(low="#F7FCB9", high= "#ADDD8E", mid= "#31A354", 
                       midpoint=0.5, limit=c(0, 1)) +
  scale_x_discrete(labels=NULL) +
  scale_y_discrete(labels=group_name) +
  theme +
  theme(plot.margin=unit(c(5.5, 5.5, 33, 5.5), "pt"))

bray <- ggplot(similarity, aes(x=V2, y=V1, fill=bray)) + 
  geom_tile(colour="black", size=0.5) +
  geom_text(aes(V2, V1, label=scaleFUN(bray)), color="black", size=7, family="Times", fontface="bold") +
  labs(x=NULL, y=NULL) +
  ggtitle("Bray-Curtis Similarity Coefficient") +
  scale_fill_gradient2(low="#F7FCB9", high= "#ADDD8E", mid= "#31A354", 
                       midpoint=0.5, limit=c(0, 1)) +
  scale_x_discrete(labels=group_name) +
  scale_y_discrete(labels=group_name) +
  theme

# Combining plots together and saving
plots <- cowplot::plot_grid(jaccard, bray, ncol=1, nrow=2, rel_heights=c(1, 1))
ggsave("results/figures/matrix.jpg", plots, width=210, height=297, units="mm")
