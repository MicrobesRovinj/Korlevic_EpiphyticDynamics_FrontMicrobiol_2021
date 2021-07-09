#################################################################################################################
# code/plot_seasonal_shared.R
# 
# A script to plot the Bray-Curtis and Jaccard's Similarity Coefficients of subsequent sampling dates.
# Dependencies: results/numerical/rarefied.Rdata
#               data/raw/metadata.csv
# Produces: results/figures/temporal_shared.jpg
#
#################################################################################################################

# Loading rarefied community data created during the generation of the richness and diversity calculators plot
load(file="results/numerical/rarefied.Rdata")

# Copying the sample labels to the rows (input for library vegan)
rarefied <- rarefied %>%
  column_to_rownames("Group")

# Calculating dissimilarity indices
jaccard <- as.matrix(vegdist(rarefied, method="jaccard", binary=T))
jaccard <- as_tibble(jaccard) %>%
  add_column("V1"=rownames(jaccard), .before=TRUE) %>%
  gather(key="V2", value="jaccard", 2:ncol(.))

bray <- as.matrix(vegdist(rarefied, method="bray", binary=F))
bray <- as_tibble(bray) %>%
  add_column("V1"=rownames(bray), .before=TRUE) %>%
  gather(key="V2", value="bray", 2:ncol(.))

distance <- inner_join(jaccard, bray, by=c("V1"="V1", "V2"="V2")) %>%
  mutate_at(c("V1", "V2"), list(~ as.character(.)))

# Loading metadata 
metadata <- read_tsv("data/raw/metadata.csv")

# Joining metadata with dissimilarity index data
Sys.setlocale(locale="en_GB.utf8")
distance_metadata <- inner_join(metadata, distance, by=c("ID"="V1")) %>%
  inner_join(., metadata, by=c("V2"="ID")) %>%
  mutate(date.x=as.Date(date.x, "%d.%m.%Y")) %>%
  mutate(date.y=as.Date(date.y, "%d.%m.%Y")) %>%
  mutate(jaccard=(1-jaccard)*100) %>%
  mutate(bray=(1-bray)*100) %>%
  gather(key="index", value="value", jaccard, bray)

# Generating a common theme for plots
theme <- theme(text=element_text(family="Times"), line=element_line(color="black"),
               panel.border=element_rect(fill=NA), panel.background=element_blank(),
               panel.grid=element_blank(), axis.line=element_blank(),
               axis.text=element_text(size=16, color="black"), axis.text.x=element_text(angle=90, hjust=0.95, vjust=1.75),
               axis.title=element_text(size=18, color="black"),
               plot.margin=unit(c(5.5, 5.5, 5.5, 5.5), "pt"), legend.position="none",
               plot.title=element_text(face="bold", size=20, hjust=0.5))

# Formatting group names and defining line types, dot shapes and fill dot colours
group_name <- c("F"=expression("Seawater"),
                "FCyM"=expression(paste(italic("Cymodocea nodosa"), plain(" (Mixed)"))),
                "FCaM"=expression(paste(italic("Caulerpa cylindracea"), plain(" (Mixed)"))),
                "FCa"=expression(paste(italic("Caulerpa cylindracea"), plain(" (Monospecific)"))))
lines <- c("F"="dotted", "FCyM"="solid", "FCaM"="solid", "FCa"="solid")
shapes <- c("F"=21, "FCyM"=21, "FCaM"=23, "FCa"=25)
fills <- c("F"="white", "FCyM"="black", "FCaM"="black", "FCa"="black")

# Plots generation
data <- distance_metadata %>%
  filter((date.x=="2017-07-13" & date.y=="2017-07-27") |
         (date.x=="2017-07-27" & date.y=="2017-08-10") |
         (date.x=="2017-08-10" & date.y=="2017-08-24") |
         (date.x=="2017-08-24" & date.y=="2017-09-19") |
         (date.x=="2017-09-19" & date.y=="2017-10-12") |
         (date.x=="2017-10-12" & date.y=="2017-11-23") |
         (date.x=="2017-11-23" & date.y=="2017-12-04") |
         (date.x=="2017-12-04" & date.y=="2017-12-14") |
         (date.x=="2017-11-23" & date.y=="2017-12-14" & (station.x=="F" & station.y=="F")) |
         (date.x=="2017-12-14" & date.y=="2018-02-13") |
         (date.x=="2018-02-13" & date.y=="2018-03-27") |
         (date.x=="2017-12-14" & date.y=="2018-03-27" & (station.x=="FCaM" & station.y=="FCaM")) |
         (date.x=="2018-03-27" & date.y=="2018-04-24") |
         (date.x=="2018-04-24" & date.y=="2018-05-22") |
         (date.x=="2018-05-22" & date.y=="2018-06-19") |
         (date.x=="2018-06-19" & date.y=="2018-07-10") |
         (date.x=="2018-07-10" & date.y=="2018-08-09") |
         (date.x=="2018-08-09" & date.y=="2018-09-04") |
         (date.x=="2018-09-04" & date.y=="2018-10-05")) %>%
  filter((station.x=="F" & station.y=="F") |
         (station.x=="FCyM" & station.y=="FCyM") |
         (station.x=="FCaM" & station.y=="FCaM") |
         (station.x=="FCa" & station.y=="FCa"))

p1 <- filter(data, index=="bray") %>%
  ggplot(aes(x=date.y, y=value, linetype=station.x, shape=station.x, fill=station.x)) +
  geom_line() +
  geom_point(size=4) +
  scale_linetype_manual(values=lines, breaks=c("F", "FCyM", "FCaM", "FCa")) +
  scale_shape_manual(values=shapes, breaks=c("F", "FCyM", "FCaM", "FCa")) +
  scale_fill_manual(values=fills, breaks=c("F", "FCyM", "FCaM", "FCa")) +
  scale_x_date(breaks=seq(as.Date("2017-07-01"), as.Date("2018-11-01"), "months"),
               labels=c("Jul 2017", "Aug 2017", "Sep 2017", "Oct 2017", "Nov 2017", "Dec 2017",
                        "Jan 2018", "Feb 2018", "Mar 2018", "Apr 2018", "May 2018", "Jun 2018",
                        "Jul 2018", "Aug 2018", "Sep 2018", "Oct 2018", ""),
               limits=as.Date(c("2017-07-01", "2018-11-01")),
               expand=c(0, 0)) +
  scale_y_continuous(limits=c(20, 80)) +
  labs(x="", y="%") +
  ggtitle("Bray-Curtis Similarity Coefficient") +
  theme +
  theme(axis.ticks.x=element_blank(), axis.text.x=element_blank())

p2 <- filter(data, index=="jaccard") %>%
  ggplot(aes(x=date.y, y=value, linetype=station.x, shape=station.x, fill=station.x)) +
  geom_line() +
  geom_point(size=4) +
  scale_linetype_manual(values=lines, labels=group_name, breaks=c("F", "FCyM", "FCaM", "FCa")) +
  scale_shape_manual(values=shapes, labels=group_name, breaks=c("F", "FCyM", "FCaM", "FCa")) +
  scale_fill_manual(values=fills, labels=group_name, breaks=c("F", "FCyM", "FCaM", "FCa")) +
  scale_x_date(breaks=seq(as.Date("2017-07-01"), as.Date("2018-11-01"), "months"),
               labels=c("Jul 2017", "Aug 2017", "Sep 2017", "Oct 2017", "Nov 2017", "Dec 2017",
                        "Jan 2018", "Feb 2018", "Mar 2018", "Apr 2018", "May 2018", "Jun 2018",
                        "Jul 2018", "Aug 2018", "Sep 2018", "Oct 2018", ""),
               limits=as.Date(c("2017-07-01", "2018-11-01")),
  expand=c(0, 0)) +
  scale_y_continuous(limits=c(10, 40)) +
  labs(x="Date", y="%") +
  ggtitle("Jaccard's Similarity Coefficient") +
  theme +
  theme(axis.text.x=element_text(angle=90, hjust=0.95, vjust=2.75),
        legend.position="bottom", legend.title=element_blank(),
        legend.text=element_text(size=16, margin=margin(r=0.2, unit="cm")),
        legend.key.width=unit(1.4, "cm"), legend.key.height=unit(0.5, "cm"),
        legend.key=element_rect(fill="white"), legend.justification=c("top"),
        legend.text.align=0) +
  guides(linetype=guide_legend(ncol=2))

# Combining plots together and saving
p <- cowplot::plot_grid(p1, p2, ncol=1, nrow=2)
ggsave("results/figures/seasonal_shared.jpg", p, width=297, height=210, units="mm")
