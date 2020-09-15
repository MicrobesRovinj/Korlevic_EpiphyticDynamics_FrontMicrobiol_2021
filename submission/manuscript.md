---
title: "**Seasonal Dynamics of Epiphytic Microbial Communities on Marine Macrophyte Surfaces**"
output:
  pdf_document:
    keep_tex: true
    includes:
      in_header: header.tex
fontsize: 12pt
geometry: margin=1.0in
csl: citation_style.csl #Get themes at https://github.com/citation-style-language/styles
bibliography: references.bib
---



\vspace{20mm}
Marino Korlević^1$*$^, Marsej Markovski^1^, Zihao Zhao^2^, Gerhard J. Herndl^2,3^, Mirjana Najdek^1^

1\. Center for Marine Research, Ruđer Bošković Institute, Croatia

2\. Department of Functional and Evolutionary Ecology, University of Vienna, Austria

3\. NIOZ, Department of Marine Microbiology and Biogeochemistry, Royal Netherlands Institute for Sea Research, Utrecht University, The Netherlands

^$*$^To whom correspondence should be addressed:

Marino Korlević

G. Paliaga 5, 52210 Rovinj, Croatia

Tel.: +385 52 804 768

Fax: +385 52 804 780

e-mail: marino.korlevic@irb.hr

Running title: Seasonal dynamics of epiphytic communities

\newpage
\linenumbers
\sisetup{mode=text}
\setlength\parindent{24pt}

## Summary
Surfaces of marine macrophytes (seagrasses and macroalgae) are inhabited by diverse microbial communities. Most studies focusing on epiphytic communities of macrophytes did not take into account temporal changes or applied low sampling frequency approaches. Illumina sequencing of the V4 16S rRNA region was performed to determine the seasonal dynamics of epiphytic communities of the seagrass *Cymodocea nodosa* and invasive macroalga *Caulerpa cylindracea*. Leaves and thalli were sampled in a meadow of *Cymodocea nodosa* invaded by the invasive *Caulerpa cylindracea* and in a monospecific settlement of *Caulerpa cylindracea* located in the proximity of the meadow at monthly intervals. For comparison the ambient prokaryotic plankton community was also characterized. At the OTU level, the microbial community composition differed between the ambient water and the epiphytic communities exhibiting host-specificity. Also, successional changes were observed connected to the macrophyte growth cycle. Taxonomic analysis, however, showed similar high rank groups in the ambient water and the epiphytic communities, with the exception of *Desulfobacterota*, which were only found on *Caulerpa cylindracea*. *Cyanobacteria* showed seasonal changes while other high rank taxa were present throughout the year. Phylogenetic groups present throughout the year constituted most of the sequences, while less abundant taxa showed seasonal patterns connected to the macrophyte growth cycle. Taken together, epiphytic microbial communities of the seagrass *Cymodocea nodosa* and the macroalgae *Caulerpa cylindracea* appear to be host-specific and contain taxa that undergo successional changes.

\newpage
## Introduction
Marine macrophytes (seagrasses and macroalgae) are important ecosystem engineers forming close associations with microorganism belonging to all three domains of life [@Tarquinio2019; @Egan2013]. Microbes can live within macrophyte tissue as endophytes or can form epiphytic communities on surfaces of leaves and thalli [@Tarquinio2019; @Egan2013; @Hollants2013]. Epiphytic and endophytic microbial communities exhibit a close functional relationship with the macrophyte host. It was proposed that this close relationship constitutes a holobiont, an integrated community where the macrophyte organism and its symbiotic partners support each other [@Margulis1991; @Tarquinio2019; @Egan2013].

Biofilms of microbial epiphytes can contain diverse taxonomic groups and harbor cell abundances from 10^2^ to 10^7^ \si{\cells\per\cm\squared} [@Armstrong2000; @Bengtsson2010; @Burke2011a]. In such an environment a number of positive and negative interactions between the macrophyte and the colonizing microorganisms have been described [@Tarquinio2019; @Egan2013; @Hollants2013]. Macrophytes can promote growth of associated microbes by nutrient exudation, while in return microorganisms may support macrophyte performance through improved nutrient availability, phytohormone production and protection from toxic compounds, oxidative stress, biofouling organisms and pathogens [@Tarquinio2019; @Egan2013; @Hollants2013]. Besides these positive interactions, macrophytes can  negatively impact the associated microbes such as pathogenic bacteria by producing reactive oxygen species and secondary metabolites [@Tarquinio2019; @Egan2013; @Hollants2013].

All these ecological roles are carried out by a taxonomically diverse community of microorganisms. At higher taxonomic ranks a core set of macrophyte epiphytic taxa was described consisting mainly of *Alphaproteobacteria*, *Gammaproteobacteria*, *Desulfobacterota*, *Bacteroidota*, *Cyanobacteria*, *Actinobacteriota*, *Firmicutes*, *Planctomycetota*, *Chloroflexi* and *Verrucomicrobiota* [@Lachnit2011; @Crump2008; @Tujula2010]. In contrast, at lower taxonomic ranks host specific microbial communities were found [@Roth-Schulze2016; @Lachnit2011]. Recently, it was shown that even different morphological niches within the same alga had a higher influence on the composition of the bacterial community than biogeography or environmental factors [@Morrissey2019]. While the microbial community composition varies between host species, metagenomic analyses revealed that the majority of the microbial functions are conserved [@Burke2011; @Roth-Schulze2016]. This discrepancy between the microbial taxonomic and functional composition might be explained by the lottery hypothesis. It postulates that an initial random colonization step takes places from a set of functionally equivalent taxonomic groups resulting in taxonomically different epiphytic communities sharing a core set of functional genes [@Burke2011; @Roth-Schulze2016]. In addition, some of the variation in the reported data could be attributed to different techniques used in these studies, such as different protocols for epiphytic cell detachment and/or DNA isolation, as no standard protocol has been yet established to study epiphytic communities [@Korlevica, submitted; @Ugarelli2019].    

The majority of studies describing macrophyte epiphytic microbial communities did not include possible seasonal changes [@Ugarelli2019; @Lachnit2009; @Crump2008; @Burke2011a; @Roth-Schulze2016]. If seasonal changes were taken into account, low temporal frequency, applied methodologies and/or limited number of analyzed host species did not allow a high taxonomic resolution [@Tujula2010; @Lachnit2011; @Miranda2013; @Michelou2013; @Mancuso2016]. In the present study we describe the seasonal dynamics of bacterial and archaeal communities on the surfaces of the seagrass *Cymodocea nodosa* and siphonous macroalgae *Caulerpa cylindracea* determined on a mostly monthly scale. Bacterial and archaeal epiphytes were sampled in a meadow of *C. nodosa* invaded by the invasive *C. cylindracea* and in a locality of only *C. cylindracea* located in the proximity of the seagrass meadow. For comparison, the microbial community of the ambient seawater was also characterized.

\newpage
## Results







Sequencing of the 16S rRNA V4 region yielded a total of 1.8 million sequences after quality curation and exclusion of sequences without known relatives (no relative sequences) and eukaryotic, chloroplast and mitochondrial sequences (\autoref{supp-nseq_notus}). A total of 35 samples originating from epiphytic archaeal and bacterial communities associated with surfaces of the seagrass *C. nodosa* and the macroalga *C. cylindracea* were analyzed. In addition, 18 samples (one of the samples was sequenced twice) originating from the ambient seawater were also processed for comparison. The number of reads per sample ranged between 8,408 and 77,463 sequences (\autoref{supp-nseq_notus}). Even when the highest sequencing effort was applied the rarefaction curves did not level off as commonly observed in high-throughput 16S rRNA amplicon sequencing approaches (\autoref{supp-rarefaction}). Following quality curation and exclusion of sequences as mentioned above reads were clustered into 28,750 different OTUs at a similarity level of 97 \si{\percent}. Read numbers were normalized to the minimum number of sequences (8,408, \autoref{supp-nseq_notus}) through rarefaction resulting in 17,071 different OTUs with 382 to 2,031 OTUs per sample (\autoref{supp-calculators}). To determine seasonal changes in richness and diversity the observed number of OTUs, Chao1, ACE, Exponential Shannon [@Jost2006] and Inverse Simpson were calculated after normalization through rarefaction. Generally, richness estimators and diversity indices showed similar trends. On average, higher values were found for *C. cylindracea* (mixed [Number of OTUs, 1,686.1 ± 142.8 OTUs] and monospecific [Number of OTUs, 1,729.5 ± 159.6 OTUs]) than for *C. nodosa* (Number of OTUs, 1,064.1 ± 210.0 OTUs) and lowest values were obtained for the microbial community of the ambient seawater (Number of OTUs, 525.4 ± 145.1 OTUs) (\autoref{supp-calculators}). Seasonal changes did not reveal such large dissimilarities. *C. nodosa* communities showed a slow increase towards the end of the study, while *C. cylindracea* (mixed and monospecific) communities were characterized by slightly higher values in spring and summer than in autumn and winter (\autoref{supp-calculators}).







To determine the proportion of shared archaeal and bacterial OTUs and communities sampled in different environments the Jaccard's Similarity Coefficient on presence-absence data and Bray-Curtis Similarity Coefficient, respectively, were calculated. Coefficients were determined after normalization through rarefaction and binning of samples from the particular environment. The highest proportion of shared OTUs and community was found between mixed and monospecific  *C. cylindracea* (Jaccard, 0.35; Bray-Curtis, 0.78), while lower shared values were calculated between ambient seawater and epiphytic communities (\autoref{matrix}). Shared proportion between *C. nodosa* and *C. cylindracea* were approximately in-between the values of mixed and monospecific *C. cylindracea*. To assess seasonal changes in the proportion of shared OTUs and communities the Jaccard's and Bray-Curtis Similarity Coefficients were calculated between consecutive sampling points (\autoref{shared}). Both coefficients showed similar trends. Temporal proportional changes were more pronounced for ambient seawater than for *C. nodosa* and especially *C. cylindracea* associated communities (\autoref{shared}). In addition, only 0.4 -- 1.0 \si{\percent} of OTUs from each surface associated community were present at all seasons. These persistent OTUs constituted a high proportion of total sequences (41.4 -- 52.4 \si{\percent}). To further disentangle the environmental and seasonal community dissimilarity a Principal Coordinates Analysis (PCoA) based on Bray-Curtis distances and OTU abundances was applied. A clear separation between ambient seawater and surface associated communities was found (\autoref{pcoa}). In addition, a separation of epiphytic bacterial and archaeal communities based on host species was detected. This separation was further supported by ANOSIM (R = 0.96, *p* < 0.001). Seasonal changes of *C. nodosa* associated communities indicated a separation between spring, summer and autumn/winter samples (ANOSIM, R = 0.54, *p* < 0.01). For *C. cylindracea* associated communities a separation between summer and autumn/winter/spring samples was observed that was, however, not as strong as for *C. nodosa* associated communities (ANOSIM, R = 0.30, *p* < 0.01) (\autoref{pcoa}).



The taxonomic composition of both, macrophyte associated and ambient seawater communities was dominated by bacterial (99.1 ± 2.1 \si{\percent}) over archaeal sequences (0.9 ± 2.1 \si{\percent}) (\autoref{community}). Higher relative abundances of chloroplast related sequences were only observed in surface associated communities, with higher values in autumn/winter (37.2 ± 11.2 \si{\percent}) than in spring/summer (20.9 ±  9.7 \si{\percent}) (\autoref{supp-chloroplast}). Generally, at higher taxonomic ranks (phylum-class), epiphytic and ambient seawater microbial communities were composed of similar bacterial taxa. Ambient seawater communities were mainly comprised of *Actinobacteriota*, *Bacteroidota*, *Cyanobacteria*, *Alphaproteobacteria*, *Gammaproteobacteria* and *Verrucomicrobiota*. Communities associated with *C. nodosa* consisted additionally of *Planctomycetota* contributing more in summer 2018 than in other seasons. In addition, communities from mixed and monospecific *C. cylindracea* were similar and characterized by the same groups as ambient seawater and *C. nodosa* communities with the addition of *Desulfobacterota* (\autoref{community}). Larger differences between environments and host species were observed at lower taxonomic ranks (Figs. \ref{cyano} -- \ref{desulfo}).



*Cyanobacteria* related sequences comprised, on average, 5.5 ± 4.4 \si{\percent} of total sequences (\autoref{cyano}). Higher proportions were found for *C. nodosa* (16.4 ± 5.3 \si{\percent}) and *C. cylindracea* mixed (7.7 ± 3.9 \si{\percent}) and monospecific (7.8 ± 2.4 \si{\percent}) associated communities in autumn and for ambient seawater communities in winter (8.8 ± 7.5 \si{\percent}). Large taxonomic differences between surface associated and ambient seawater cyanobacterial communities were observed. Ambient seawater communities were mainly comprised of *Cyanobium* and *Synechococcus*, while surface associated communities were comprised of *Pleurocapsa* and sequences within the class *Cyanobacteriia* that could not be further classified (no relative *Cyanobacteriia*) (\autoref{cyano}). In addition, seasonal changes in surface associated communities were observed in *Pleurocapsa* and no relative *Cyanobacteriia* comprising larger proportions in autumn and winter and *Acrophormium*, *Phormidesmis* and sequences without known relatives within the *Nodosilineaceae* (no relative *Nodosilineaceae*) in spring and summer (\autoref{cyano}).



Sequences classified as *Bacteroidota* comprised, on average, 19.2 ± 5.5 \si{\percent} of all sequences (\autoref{bactero}). Similarly to *Cyanobacteria*, large differences in the taxonomic composition between ambient seawater and surface associated communities were found (\autoref{bactero}). The ambient seawater community was characterized by the NS4 and NS5 marine groups, uncultured *Cryomorphaceae*, uncultured *Flavobacteriaceae*, NS11-12 marine group, *Balneola*, uncultured *Balneolaceae* and *Formosa*. In contrast, in surface associated communities *Lewinella*, *Portibacter*, *Rubidimonas*, sequences without known relatives within the *Saprospiraceae* (no relative *Saprospiraceae*), uncultured *Saprospiraceae*, (sequences without known relatives within the *Flavobacteriaceae* (no relative *Flavobacteriaceae*)and uncultured *Rhodothermaceae* were found. Some groups showed minor seasonal changes such as no relative *Flavobacteriaceae* whose sequences were more abundant from November 2017 until June 2018. In contrast, uncultured *Rhodothermaceae* showed higher proportions from June 2018 until the end of the study period. Surface associated *Bacteroidota* communities were very diverse as observed in the high proportion of taxa clustering as other *Bacteroidota* (\autoref{bactero}).



On average, *Alphaproteobacteria* were in comparison to the other high rank taxa the largest taxonomic group, comprising 29.2 ± 12.0 \si{\percent} of all sequences (\autoref{alpha}). In accordance to the above described taxa, large differences between ambient seawater and surface associated communities were observed. Ambient seawater communities were composed mainly of the SAR11 clade, AEGEAN-169 marine group, SAR116 clade, sequences without known relatives within the *Rhodobacteraceae* (no relative *Rhodobacteraceae*), HIMB11 and the OCS116 clade, while surface associated communities were composed mainly of no relative *Rhodobacteraceae* and to a lesser degree of *Pseudoahrensia*, *Amylibacter* and sequences without known relatives within the *Alphaproteobacteria* (no relative *Alphaproteobacteria*) and *Hyphomonadaceae* (no relative  *Hyphomonadaceae*). Representatives of no relative *Rhodobacteraceae* comprised on average 40.6 ± 23.2 \si{\percent} of all alphaproteobacterial sequences in the epiphytic community (\autoref{alpha}). In addition, *Amylibacter* was detected mainly in *C. nodosa* from November 2017 until March 2018.



Sequences related to *Gammaproteobacteria* comprised on average 18.6 ± 3.9 \si{\percent} of all sequences (\autoref{gamma}). Similar to above mentioned taxa, large taxonomic differences between ambient seawater and surface associated communities were found. Ambient seawater communities were mainly comprised of the OM60 (NOR5) clade, *Litoricola*, *Acinetobacter* and the SAR86 clade, while epiphytic communities were mainly composed of sequences without known relatives within the *Gammaproteobacteria* (no relative *Gammaproteobacteria*) and *Granulosicoccus*. Beside these two groups specific to all three epiphytic communities, *C. nodosa* was characterized by *Arenicella*, *Methylotenera* and sequences without known relatives within the *Burkholderiales* (no relative *Burkholderiales*), while *Thioploca*, *Reinekea* and sequences without known relatives within *Cellvibrionaceae* (no relative *Cellvibrionaceae*) were more specific to both mixed and monospecific *C. cylindracea*. In addition, *Arenicella* was more pronounced in November and December 2017, while no relative *Burkholderiales* and *Methylotenera* were characteristic for the period from March until May 2018. For the *C. cylindracea* specific taxa no relative *Cellvibrionaceae* and *Reinekea* showed seasonality and were characteristic for samples originating from June to October 2018. In addition, similar to *Bacteroidota*, a large proportion of the surface associated community was grouped as other *Gammaproteobacteria* indicating high diversity within this group (\autoref{gamma}).



*Desulfobacterota* were specific for *C. cylindracea*. In the mixed and monospecific *C. cylindracea* communities the proportion of *Desulfobacterota* was 25.7 ± 11.2 \si{\percent} and 24.0 ± 4.3 \si{\percent}, respectively (\autoref{desulfo}). In contrast, in ambient seawater and *C. nodosa* communities the contribution of *Desulfobacterota* was only 0.1 ± 0.08 \si{\percent} and 1.0 ± 0.7 \si{\percent}, respectively. In *C. cylindracea* the community consisted mainly of *Desulfatitalea*, *Desulfobulbus*, *Desulfopila*, *Desulforhopalus*, *Desulfotalea*, SEEP-SRB4, uncultured *Desulfocapsaceae* and sequences without known relatives within the *Desulfobacteraceae* (no relative *Desulfobacteraceae*), *Desulfobulbaceae* (no relative *Desulfobulbaceae*) and *Desulfocapsaceae* (no relative *Desulfocapsaceae*) (\autoref{desulfo}).

\newpage
## Discussion
Surfaces of marine macrophytes harbor biofilms consisting of diverse microbial taxa [@Egan2013; @Tarquinio2019]. No standard protocol has been developed to study these macophyte-associated microbes [@Ugarelli2019]. Different procedures for removal of microbial cells from host surfaces are described, such as host tissue shaking [@Noges2010], scraping [@Uku2007], swabbing [@Mancuso2016] and ultrasonication [@Cai2014]. All these methods result in different removal efficiencies but none was enabling a complete removal of attached microbial cells based on our experience. In the present study, we applied a removal protocol [@Korlevica, submitted] based on direct cellular lysis [@Burke2009]. The application of a direct lysis procedure coupled with a high sampling frequency and Illumina amplicon sequencing has enabled us to described in detail the bacterial and archaeal communities associated with the surfaces of two marine macrophytes, *C. nodosa* and *C. cylindracea*.

In the present study, highest richness was observed for *C. cylindracea* (mixed and monospecific) followed by *C. nodosa* and lowest richness was found in ambient seawater microbial communities. Higher richness of microbial communities associated with seagrasses than in ambient seawater was described earlier and could be attributed to a larger set of inhabitable microniches existing on macrophyte surfaces than in the ambient seawater [@Ugarelli2019]. The highest richness observed for *C. cylindracea* might be partly due to its contact with the sediment. The stolon of *C. cylindracea* is attached to the sediment surface with rhizoids and thus, the stolon and rhizoids are in a direct contact with the sediment. In addition, seasonal differences in richness observed for surface attached communities indicated a slightly higher richness in spring and summer. This pattern could be explained by a higher macrophyte growth in these two seasons than in autumn and winter [M. Najdek, personal communication; @Zavodnik1998; @Ruitton2005]. During their main growth season in spring and summer macrophytes exhibit a more dynamic chemical interaction with the surface community probably causing an increase in the number of inhabitable microniches [@Rickert2016; @Borges2015].

We observed a strong differentiation between the surface attached and ambient seawater communities at the level of OTUs, in agreement with most published studies [@Ugarelli2019; @Roth-Schulze2016; @Burke2011a; @Michelou2013; @Crump2018; @Mancuso2016]. This indicates that marine macrophytes are a selecting factor from the pool of microbial taxa present in the ambient seawater, modifying the microbial community once the macrophyte associated microbial biofilm develops [@Salaun2012; @Michelou2013]. In contrast, @Fahimipour2017 report in a global study of *Zostera marina*, similarities between the microbial community developed on leaves and in the ambient seawater. The discrepancy between our data and the study of @Fahimipour2017 could be explained by different seagrass species, methodological variations or biogeographic trends as @Fahimipour2017 analyzed samples from different locations throughout the northern hemisphere. It is possible that the microbial communities in ambient seawater and on leaves from the same location are differing but are still more similar to each other when compared to other sampling locations. Indeed, it was found that prokaryotic communities vary substantially between different sampling sites [@Bengtsson2017]. When the taxonomic composition at high ranks was analyzed no such strong differentiation was noticed. Phyla and classes such as *Actinobacteriota*, *Bacteroidota*, *Cyanobacteria*, *Alphaproteobacteria*, *Gammaproteobacteria* and *Verrucomicrobiota* were found in both ambient seawater as well as macrophyte associated, in agreement with previous studies [@Egan2013; @Michelou2013; @Burke2011a]. In contrast, when low taxonomic ranks were analyzed (i.e., family and genus) a strong differentiation was observed (Figs. \ref{cyano} -- \ref{desulfo}). A similar differentiation at lower microbial taxonomic ranks between ambient seawater and macrophytes was described for other macrophyte species as well [@Egan2013; @Michelou2013; @Ugarelli2019].

Beside differences between ambient seawater and surface associated microbial communities, it is unclear whether the prokaryotic epiphytic community is host-specific or whether there are generalist taxa characteristic to all or many macrophytes [@Egan2013]. Similar to previously described differences between microbial communities in the ambient seawater and on macrophytes, at high taxonomic ranks no major difference between the microbial communities associated with different hosts was observed. The only high rank phylum that was differing between *C. nodosa* and *C. cylindracea* was *Desulfobacterota*, with more abundant sequences in the *C. cylindracea* associated community. As already mentioned, the rhizoids and part of the stolon are in contact with the sediment. Thus *Desulfobacterota* are probably a part of the epiphytic community that was in contact with the sediment. Similar high rank taxa found in this study were described to be specific for other species of macrophytes [@Burke2011a; @Lachnit2011; @Bengtsson2017; @Mancuso2016]. In contrast to high taxonomic ranks, a substantial differentiation between host specific communities was found supporting the notion that macrophyte associated microbial communities might be host-specific. Host-specificity was also observed for other species of macroalgae and seagrasses [@Lachnit2011; @Roth-Schulze2016; @Ugarelli2019; @Morrissey2019]. Taken together, at high taxonomic ranks a core set of taxa could be described that is characteristic for all or many macrophytes, while at low taxonomic ranks a community specific to host species was identified (Figs. \ref{pcoa} and \ref{community}) [@Egan2013].

Seasonal changes in richness in the epiphytic community were substantial as indicated by the proportion of OTUs ($\leq$ 1.0 \si{\percent}) present at every sampling date. These persistent OTUs, however, were accounting for a high proportion of sequences ($\leq$ 52.4 \si{\percent}) (\autoref{shared}). A very similar proportion of persistent OTUs was reported in high-frequency sampling studies describing seasonal changes in picoplankton [@Gilbert2009; @Gilbert2012]. In comparison to the seawater community, a lower degree of seasonal shifts was observed for the macrophyte surface associated communities. It appears that microniches at the surfaces of macrophytes are providing more stable conditions than the ambient seawater. At the level of OTUs seasonal changes of *C. nodosa* and *C. cylindracea* associated communities were identified that could be linked to the growth cycle of the seagrass and macroalgae (M. Najdek, personal communication). *C. nodosa* was characterized by a spring community during maximum seagrass proliferation, a summer community during the highest standing stock of *C.nodosa* and an autumn/winter community during the decay of seagrass biomass. In contrast, *C. cylindracea* started to proliferate in late spring and was characterized only by a summer community during high growth rates and by an autumn/winter/spring community when the biomass was at the peak and decaying thereafter. Similar seasonal changes in the epiphytic community were also described for other macroalgae [@Lachnit2011; @Tujula2010]. Higher seasonal stability of *C. cylindracea* surface communities than in *C. nodosa* was also observed in the higher proportion of shared communities between two consecutive sampling dates in *C. cylindracea*.

Chloroplast sequence abundances were higher in autumn/winter than in spring/summer. This pattern is not surprising as seagrasses harbor more algal epiphytes during autumn/winter than in spring/summer [@Reyes2001]. Furthermore, we used an adapted DNA isolation protocol that is known to partially co-extract DNA from planktonic eukaryotes [@Korlevic2015]. Strong seasonal fluctuations of high rank epiphytic taxa were not observed, with the exception of *Cyanobacteria*. Cyanobacterial sequences were more pronounced in November and December than in spring and summer. In the months of high cyanobacterial sequence abundances the majority of sequences from this group were classified as *Pleurocapsa*, a group known to colonized different living and non-living surfaces [@Longford2007; @Burns2004; @Mobberley2012; @Reisser2014]. It is possible that during periods of low metabolic activity there is a reduced interaction and selection of the epiphytic community by the seagrass, causing leaves to become a suitable surface for nonspecific colonizers [@Zavodnik1998]. *Pleurocapsa* was replaced in spring and summer by *Acrophormium*, *Phormidesmis* and sequences without known relatives within the *Nodosilineaceae*. A study of coastal microbial mats found also a higher proportion of *Nodosilineaceae* sequences in summer, while *Phormidesmis* sequences were at their peak in autumn [@Cardoso2019]. Other high rank taxa did not exhibit strong successional patterns. In every analyzed group, with the exception of *Desulfobacterota*, taxa present throughout the year in similar proportions and season specific taxa could be identified (Figs. \ref{bactero} and \ref{desulfo}). Within *Bacteroidota* different groups within the family *Saprospiraceae* (e.g. *Lewinella*, *Portibacter* and *Rubidimonas*) were detected across all seasons. Members of this family are often found in association with macrophytes and it is suggested that they are involved in the hydrolysis and utilization of complex carbon sources [@Burke2011a; @Crump2018; @McIlroy2014]. In contrast, the families *Flavobacteriaceae* and *Rhodothermaceae* showed seasonal patterns, with *Flavobacteriaceae* being more pronounced from November to June and *Rhodothermaceae* from June to October (\autoref{bactero}). Within *Alphaproteobacteria* the family *Rhodobacteraceae* comprised the majority of sequences throughout the year (\autoref{alpha}). This metabolically versatile family is often associated with macrophyte surfaces and usually is one of the most abundant groups [@Burke2011a; @Michelou2013; @Pujalte2014; @Mancuso2016]. In addition, *Hyphomonadaceae* were found in all samples. Interestingly, some of the species within this group contain stalks on their cells, which can be used to attach to the macrophyte surface [@Weidner2000; @Abraham2014]. Within the *Gammaproteobacteria*, sequences without known representatives were the most pronounced group present throughout the year (\autoref{gamma}). In addition, *Granulosicoccus* was also found in almost all samples. *Gammaproteobacteria* are often a major constituent of macrophyte epiphytic communities [@Michelou2013; @Burke2011a; @Crump2018]. Beside these two groups, other less abundant, taxa showed seasonal and host-specific patterns. For example, *C. cylindracea* harbored *Thioploca*, a known sulfur sediment bacteria and *Cellvibrionaceae*, a family with cultured members known as polysaccharide degraders [@Jorgensen1999; @Xie2017]. *Desulfobacterota* were found only associated with *C. cylindracea* and no group within this phylum showed seasonal patterns (\autoref{desulfo}). The presence of this phylum only on *C. cylindracea* is to be expected as part of the epiphytic community is in direct contact with the sediment. The *Desulfobacterota* community was dominated by *Desulfatitalea* and no relative *Desulfocapsaceae*, known sulfate sediment groups [@Higashioka2015; @Kuever2014].

In temperate zones, marine macrophytes are exhibiting growth cycles, so it  is not surprising that the associated epiphytic microbial community is undergoing partial seasonal changes. In the present study, we could identify in every analyzed high rank taxa phylogenetic groups present throughout the year, comprising most of the sequences and a lower proportion of taxa showing seasonal patterns connected to the macrophyte growth cycle (Figs. \ref{community} and \ref{desulfo}). Studies focusing on functional comparisons between communities associated with different hosts showed that the majority of functions could be found in every community, indicating functional redundancy [@Roth-Schulze2016]. This difference between phylogenetic varaibility and functional stability was explained by the lottery hypothesis assuming an initial random colonization step performed by a set of functionally equivalent taxonomic groups [@Burke2011; @Roth-Schulze2016]. It is possible that functional redundancy is a characteristic of high abundance taxa detected to be present throughout the year, while seasonal and/or host-specific functions are an attribute of taxa displaying successional patterns. Further studies connecting taxonomy with functional properties will be required to elucidate the degree of functional redundancy or specificity in epiphytic microbial communities.

\newpage
## Experimental procedures
### Sampling
Sampling was performed in the Bay of Funtana, northern Adriatic Sea (\ang{45;10;39} N, \ang{13;35;42} E). Leaves and thalli were sampled in a meadow of *Cymodocea nodosa* invaded by the invasive *Caulerpa cylindracea* (mixed settlement) and in a monospecific settlement of *Caulerpa cylindracea* located in the proximity of the meadow at approximately monthly intervals from December 2017 to October 2018 (\autoref{supp-nseq_notus}). Leaves and thalli were collected by diving and transported to the laboratory in containers placed on ice and filled with seawater collected at the sampling site. Upon arrival to the laboratory, *C. nodosa* leaves were cut into sections of 1 -- 2 \si{\cm}, while *C. cylindracea* thalli were cut into 5 -- 8 \si{\cm} long sections. Leaves and thalli were washed three times with sterile artificial seawater (ASW) to remove loosely attached microbial cells. Ambient seawater was collected in 10 \si{\l} containers by diving and transported to the laboratory where the whole container volume was filtered through a 20 \si{\um} net. The filtrate was further sequentially filtered through 3 \si{\um} and 0.2 \si{\um} polycarbonate membrane filters (Whatman, United Kingdom) using a peristaltic pump. Filters were briefly dried at room temperature and stored at \num{-80} \si{\degreeCelsius}. Seawater samples were also collected approximately monthly from July 2017 to October 2018.

### DNA isolation
DNA from surfaces of *C. nodosa* and *C. cylindracea* was isolated using a previously modified and adapted protocol that allows for a selective epiphytic DNA isolation [@Korlevica, submitted; @Massana1997]. Briefly, leaves and thalli are incubated in a lysis buffer and treated with lysozyme and proteinase K. Following the incubations, the mixture containing lysed epiphytic cells was separated from the leaves and thalli and extracted using phenol-chloroform. Finally, the extracted DNA was precipitated using isopropanol. DNA from seawater picoplankton was extracted from 0.2 \si{\um} polycarbonate filters according to @Massana1997 with a slight modification. Following the phenol-chloroform extraction, 1/10 of chilled 3 \si{\Molar} sodium acetate (pH 5.2) was added. DNA was precipitated by adding 1 volume of chilled isopropanol, incubating the mixtures overnight at \num{-20} \si{\degreeCelsius} and centrifuging at 20,000 × *g* and 4 \si{\degreeCelsius} for 21 \si{\minute}. The pellet was washed twice with 500 \si{\ul} of chilled 70 \si{\percent} ethanol and centrifuged after each washing step at 20,000 × *g* and 4 \si{\degreeCelsius} for 5 \si{\minute}. Dried pellets were re-suspended in 50 -- 100 \si{\ul} of deionized water.

### Illumina 16S rRNA sequencing
Illumina MiSeq sequencing of the V4 region of the 16S rRNA gene was performed as described previously [@Korlevica, submitted]. The V4 region of the 16S rRNA gene was amplified using a two-step PCR procedure. In the first PCR, the 515F (5'-GTGYCAGCMGCCGCGGTAA-3') and 806R (5'-GGACTACNVGGGTWTCTAAT-3') primers from the Earth Microbiome Project (http://press.igsb.anl.gov/earthmicrobiome/protocols-and-standards/16s/) were used [@Caporaso2012; @Apprill2015; @Parada2016]. These primers contained on their 5' end a tagged sequence. Purified PCR products were sent for Illumina MiSeq sequencing at IMGM Laboratories, Martinsried, Germany. Prior to sequencing at IMGM, the second PCR amplification of the two-step PCR procedure was performed using primers targeting the tagged region incorporated in the first PCR. In addition, these primers contained adapter and sample-specific index sequences. Beside samples, a positive and negative control for each sequencing batch was sequenced. The negative control comprised PCR reactions without DNA template, while for a positive control a mock community composed of evenly mixed DNA material originating from 20 bacterial strains (ATCC MSA-1002, ATCC, USA) was used. Sequences obtained in this study have been deposited in the European Nucleotide Archive (ENA) at EMBL-EBI under accession number PRJEB37267.

### Sequence analysis


Obtained sequences were analyzed on the computer cluster Isabella (University Computing Center, University of Zagreb) using mothur (version 1.43.0) [@Schloss2009] according to the MiSeq Standard Operating Procedure (MiSeq SOP; https://mothur.org/wiki/MiSeq_SOP) [@Kozich2013] and recommendations provided by the Riffomonas project to enhance data reproducibility (http://www.riffomonas.org/). For alignment and classification of sequences the SILVA SSU Ref NR 99 database (release 138; http://www.arb-silva.de) was used [@Quast2013; @Yilmaz2014]. Pipeline data processing and visualization was done using R (version 3.6.0) [@RCoreTeam2019] combined with  packages  vegan (version 2.5-6) [@Oksanen2019], tidyverse (version 1.3.0) [@Wickham2019] and multiple other packages [@Xie2014; @Xie2015; @Xie2019a; @Xie2020; @Allaire2019; @Xie2018; @Zhu2019; @Neuwirth2014; @Wilke2018]. The detailed analysis procedure including the R Markdown file are available in the GitHub repository (https://github.com/MicrobesRovinj/Korlevic_EpiphyticDynamics_EnvironMicrobiol_2020). Based on the ATCC MSA-1002 mock community included in the analysis an average sequencing error rate of 0.01 \si{\percent} was determined, which is in line with previously reported values for next-generation sequencing data [@Kozich2013; @Schloss2016]. In addition, the negative controls processed together with the samples yielded on average only 2 sequences after sequence quality curation. 

## Acknowledgments
This work was founded by the Croatian Science Foundation through the MICRO-SEAGRASS project (IP-2016-06-7118). We would like to thank Margareta Buterer for technical support, Paolo Paliaga for help during sampling and the University Computing Center of the University of Zagreb for access to the computer cluster Isabella.

\newpage
## References
\interlinepenalty=10000
\setlength{\emergencystretch}{3.5em}
<div id="refs"></div>

\newpage 
\setlength\parindent{0pt}

## Figure legends
**\autoref{matrix}.** \nameref{matrix}

**\autoref{shared}.** \nameref{shared}

**\autoref{pcoa}.** \nameref{pcoa}

**\autoref{community}.** \nameref{community}

**\autoref{cyano}.** \nameref{cyano}

**\autoref{bactero}.** \nameref{bactero}

**\autoref{alpha}.** \nameref{alpha}

**\autoref{gamma}.** \nameref{gamma}

**\autoref{desulfo}.** \nameref{desulfo}

## Figures
\begin{figure}[H]

{\centering \includegraphics[width=0.7\linewidth]{../results/figures/matrix} 

}

\caption{Proportion of shared bacterial and archaeal OTUs (Jaccard's similarity coefficient) and shared bacterial and archaeal communities (Bray-Curtis similarity coefficient) between assemblages associated with the surfaces of the macrophytes \textit{C. nodosa} (mixed settlement) and \textit{C. cylindracea} (mixed and monospecific settlement) and communities in the ambient seawater.\label{matrix}}\label{fig:unnamed-chunk-1}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.85\linewidth]{../results/figures/seasonal_shared} 

}

\caption{Proportion of shared bacterial and archaeal communities (Bray-Curtis similarity coefficient) and shared bacterial and archaeal OTUs (Jaccard's similarity coefficient) between consecutive sampling dates and from the surfaces of the macrophytes \textit{C. nodosa} (mixed settlement) and \textit{C. cylindracea} (mixed and monospecific settlement) and in the ambient seawater.\label{shared}}\label{fig:unnamed-chunk-2}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.55\linewidth]{../results/figures/pcoa_figure} 

}

\caption{Principal Coordinates Analysis (PCoA) of Bray-Curtis distances based on OTU abundances of bacterial and archaeal communities from the surfaces of the macrophytes \textit{C. nodosa} (mixed settlement) and \textit{C. cylindracea} (mixed and monospecific settlement) and in the ambient seawater. Samples from the same environment or same season are labeled in different colors. The proportion of explained variation by each axis is shown on the corresponding axis in parentheses.\label{pcoa}}\label{fig:unnamed-chunk-3}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.85\linewidth]{../results/figures/community_bar_plot} 

}

\caption{Taxonomic classification and relative contribution of the most abundant (> 1 \si{\percent}) bacterial and archaeal sequences on the surfaces of the macrophytes \textit{C. nodosa} (mixed settlement) and \textit{C. cylindracea} (mixed and monospecific settlement) and in the ambient seawater. NR -- No Relative (sequences without known relatives within the corresponding group)\label{community}}\label{fig:unnamed-chunk-4}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.85\linewidth]{../results/figures/cyanobacteria_bar_plot} 

}

\caption{Taxonomic classification and relative contribution of the most abundant (> 1 \si{\percent}) cyanobacterial sequences on the surfaces of the macrophytes \textit{C. nodosa} (mixed settlement) and \textit{C. cylindracea} (mixed and monospecific settlement) and in the ambient seawater. The proportion of cyanobacterial sequences in the total bacterial and archaeal community is given above the corresponding bar. NR -- No Relative (sequences without known relatives within the corresponding group)\label{cyano}}\label{fig:unnamed-chunk-5}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.85\linewidth]{../results/figures/bacteroidota_bar_plot} 

}

\caption{Taxonomic classification and relative contribution of the most abundant (> 2 \si{\percent}) sequences within the \textit{Bacteroidota} on the surfaces of the macrophytes \textit{C. nodosa} (mixed settlement) and \textit{C. cylindracea} (mixed and monospecific settlement) and in the ambient seawater. The proportion of sequences classified as \textit{Bacteroidota} in the total bacterial and archaeal community is given above the corresponding bar. NR -- No Relative (sequences without known relatives within the corresponding group)\label{bactero}}\label{fig:unnamed-chunk-6}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.85\linewidth]{../results/figures/alphaproteobacteria_bar_plot} 

}

\caption{Taxonomic classification and relative contribution of the most abundant (> 2 \si{\percent}) alphaproteobacterial sequences on the surfaces of the macrophytes \textit{C. nodosa} (mixed settlement) and \textit{C. cylindracea} (mixed and monospecific settlement) and in the ambient seawater. The proportion of alphaproteobacterial sequences in the total bacterial and archaeal community is given above the corresponding bar. NR -- No Relative (sequences without known relatives within the corresponding group)\label{alpha}}\label{fig:unnamed-chunk-7}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.85\linewidth]{../results/figures/gammaproteobacteria_bar_plot} 

}

\caption{Taxonomic classification and relative contribution of the most abundant (> 2 \si{\percent}) gammaproteobacterial sequences on the surfaces of the macrophytes \textit{C. nodosa} (mixed settlement) and \textit{C. cylindracea} (mixed and monospecific settlement) and in the ambient seawater. The proportion of gammaproteobacterial sequences in the total bacterial and archaeal community is given above the corresponding bar. NR -- No Relative (sequences without known relatives within the corresponding group)\label{gamma}}\label{fig:unnamed-chunk-8}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.85\linewidth]{../results/figures/desulfobacterota_bar_plot} 

}

\caption{Taxonomic classification and relative contribution of the most abundant (> 1 \si{\percent}) sequences within the \textit{Desulfobacterota} on the surfaces of the macrophytes \textit{C. nodosa} (mixed settlement) and \textit{C. cylindracea} (mixed and monospecific settlement) and in the ambient seawater. The proportion of sequences classified as \textit{Desulfobacterota} in the total bacterial and archaeal community is given above the corresponding bar. NR -- No Relative (sequences without known relatives within the corresponding group)\label{desulfo}}\label{fig:unnamed-chunk-9}
\end{figure}
