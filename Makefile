MOTHUR = code/mothur/mothur
RAW = data/raw/
MOTH = data/mothur/
REFS = data/references/
BASIC_STEM = data/mothur/raw.trim.contigs.good.unique.good.filter.unique.precluster
FIGS = results/figures/
TABLES = results/tables/
PROC = data/process/
FINAL = submission/

# Obtain the Linux version of mothur (v.1.43.0) from the mothur GitHub repository
$(MOTHUR) :
	wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v.1.43.0/Mothur.linux.zip
	unzip Mothur.linux.zip
	mv mothur code/
	rm Mothur.linux.zip
	rm -rf __MACOSX

#########################################################################################
#
# Part 1: Create the reference files
#
# 	We will need several reference files to complete the analyses including the
# SILVA reference alignment and taxonomy. As we are analyzing both Bacteria and
# Archaea we need to optimize the procedure described on the mothur blog
# (http://blog.mothur.org/2018/01/10/SILVA-v132-reference-files/).
#
#########################################################################################

# We want the latest greatest reference alignment and the SILVA reference
# alignment is the best reference alignment on the market. We will use the
# version 138. The curation of the reference files to make them compatible with
# mothur is described at http://blog.mothur.org/2018/01/10/SILVA-v132-reference-files/
# As we are using primers from the Earth Microbiome Project that are targeting
# both Bacteria and Archaea (http://www.earthmicrobiome.org/protocols-and-standards/16s/)
# we need to modify the procedure described at
# http://blog.mothur.org/2018/01/10/SILVA-v132-reference-files/
# as this approach is removing shorter archeal sequences.
#
# The SILVA Release 138 was downloaded from
# https://www.arb-silva.de/fileadmin/silva_databases/release_138/ARB_files/SILVA_138_SSURef_NR99_05_01_20_opt.arb.gz
# opened with ARB and exported to silva.full_v138.fasta file as described at
# http://blog.mothur.org/2018/01/10/SILVA-v132-reference-files/ uder the
# section Getting the data in and out of the ARB database. A total of 447,349
# sequences were exported.

# Screening the sequences
$(REFS)silva.nr_v138.align : $(MOTHUR)\
                             ~/references/silva.full_v138/silva.full_v138.fasta
	cp ~/references/silva.full_v138/silva.full_v138.fasta $(REFS)silva.full_v138.fasta
	$(MOTHUR) "#set.dir(input=$(REFS), output=$(REFS));\
	            screen.seqs(fasta=$(REFS)silva.full_v138.fasta, start=11894, end=25319, maxambig=5, processors=16)"
	# Generate alignment file
	mv $(REFS)silva.full_v138.good.fasta $(REFS)silva.nr_v138.align

# Generate taxonomy file
$(REFS)silva.nr_v138.full : $(REFS)silva.nr_v138.align\
                            $(MOTHUR)
	grep '>' $(REFS)silva.nr_v138.align | cut -f 1,3 | cut -f 2 -d '>' > $(REFS)silva.nr_v138.full

# Formatting the taxonomy files
$(REFS)silva.nr_v138.tax : code/format_taxonomy.R\
                           $(REFS)silva.nr_v138.full
	wget https://www.arb-silva.de/fileadmin/silva_databases/release_138/Exports/taxonomy/tax_slv_ssu_138.txt.gz
	gunzip tax_slv_ssu_138.txt.gz
	mv tax_slv_ssu_138.txt $(REFS)tax_slv_ssu_138.txt
	R -e "source('code/format_taxonomy.R')"
	mv $(REFS)silva.full_v138.tax $(REFS)silva.nr_v138.tax

# Trimming the database to the region of interest (V4 region)
$(REFS)silva.nr_v138.pcr%align\
$(REFS)silva.nr_v138.pcr.unique%align : $(REFS)silva.nr_v138.align\
                                        $(MOTHUR)
	$(MOTHUR) "#set.dir(input=$(REFS), output=$(REFS));\
	            pcr.seqs(fasta=$(REFS)silva.nr_v138.align, start=11894, end=25319, keepdots=F, processors=16);\
	            unique.seqs()"

#########################################################################################
#
# Part 2: Run data through mothur and get the sequencing error
#
# 	Process fastq data through the generation of files that will be used in the
# overall analysis.
#
#########################################################################################

$(RAW)raw.files : $(RAW)metadata.csv
	cut -f 1,2,3 data/raw/metadata.csv | tail -n +2 > $(RAW)raw.files

$(RAW)*.fastq : $(RAW)raw.files\
                ~/raw/together/*.fastq
	(cut -f 2 $(RAW)raw.files; cut -f 3 $(RAW)raw.files) | cat > $(RAW)names_file.txt
	xargs -I % --arg-file=$(RAW)names_file.txt cp ~/raw/together/% -t $(RAW)

# Here we go from the raw fastq files and the files file to generate a fasta,
# taxonomy, and count_table file that has had the chimeras removed as well as
# any non bacterial or archeal sequences.
# The raw data (.fastq files) should be locateted in data/raw/

# Add a primer.oligos file containing the sequences of the gene speciic primers
$(MOTH)raw.trim.contigs%fasta\
$(MOTH)raw.trim.contigs.good.unique%fasta\
$(MOTH)raw.trim.contigs.good%count_table\
$(MOTH)raw.trim.contigs.good%unique.align\
$(MOTH)raw.trim.contigs.good%unique.good.align\
$(MOTH)raw.trim.contigs.good.good%count_table\
$(BASIC_STEM).pick%fasta\
$(BASIC_STEM).denovo.vsearch.pick%count_table\
$(BASIC_STEM).pick.pick%fasta\
$(BASIC_STEM).denovo.vsearch.pick.pick%count_table\
$(BASIC_STEM).pick.nr_v138.wang.pick%taxonomy\
$(BASIC_STEM).pick.nr_v138.wang.tax%summary : code/get_good_seqs.batch\
                                              $(RAW)raw.files\
                                              $(RAW)primer.oligos\
                                              $(RAW)*.fastq\
                                              $(REFS)silva.nr_v138.pcr.align\
                                              $(REFS)silva.nr_v138.pcr.unique.align\
                                              $(REFS)silva.nr_v138.tax\
                                              $(MOTHUR)
	$(MOTHUR) code/get_good_seqs.batch
	rm data/mothur/*.map

# Create a summary.txt file to check that all went alright throughout the code/get_good_seqs.batch
$(MOTH)summary.txt : $(REFS)silva.nr_v138.pcr.align\
                     $(REFS)silva.nr_v138.pcr.unique.align\
                     $(MOTH)raw.trim.contigs.fasta\
                     $(MOTH)raw.trim.contigs.good.unique.fasta\
                     $(MOTH)raw.trim.contigs.good.count_table\
                     $(MOTH)raw.trim.contigs.good.unique.align\
                     $(MOTH)raw.trim.contigs.good.unique.good.align\
                     $(MOTH)raw.trim.contigs.good.good.count_table\
                     $(BASIC_STEM).pick.fasta\
                     $(BASIC_STEM).denovo.vsearch.pick.count_table\
                     $(BASIC_STEM).pick.pick.fasta\
                     $(BASIC_STEM).denovo.vsearch.pick.pick.count_table\
                     $(MOTHUR)
	$(MOTHUR) code/get_summary.batch

# Here we go from the good sequences and generate a shared file and a
# cons.taxonomy file based on OTU data.

# Edit code/get_shared_otus.batch to include the proper root name of your files file.
# Edit code/get_shared_otus.batch to include the proper group names to remove.
$(BASIC_STEM).pick.pick.pick.opti_mcc%shared\
$(BASIC_STEM).pick.pick.pick.opti_mcc.unique_list.0.03.cons%taxonomy : code/get_shared_otus.batch\
                                                                       $(BASIC_STEM).pick.pick.fasta\
                                                                       $(BASIC_STEM).denovo.vsearch.pick.pick.count_table\
                                                                       $(BASIC_STEM).pick.nr_v138.wang.pick.taxonomy\
                                                                       $(MOTHUR)
	$(MOTHUR) code/get_shared_otus.batch
	rm $(BASIC_STEM).denovo.vsearch.pick.pick.pick.count_table
	rm $(BASIC_STEM).pick.pick.pick.fasta
	rm $(BASIC_STEM).pick.nr_v138.wang.pick.pick.taxonomy

# Now we want to get the sequencing error as seen in the mock community samples.
# Edit code/get_error.batch to include the proper group names for your mocks.
$(BASIC_STEM).pick.pick.pick.error.summary : code/get_error.batch\
                                             $(BASIC_STEM).pick.pick.fasta\
                                             $(BASIC_STEM).denovo.vsearch.pick.pick.count_table\
                                             $(REFS)atcc_v4.fasta\
                                             $(MOTHUR)
	$(MOTHUR) code/get_error.batch

#########################################################################################
#
# Part 3: Figure and table generation
#
# 	Run scripts to generate figures and tables
#
#########################################################################################

# Generate community composition bar plots
$(FIGS)community_bar_plot%jpg\
$(FIGS)chloroplast_bar_plot%jpg\
$(FIGS)cyanobacteria_bar_plot%jpg\
$(FIGS)bacteroidota_bar_plot%jpg\
$(FIGS)alphaproteobacteria_bar_plot%jpg\
$(FIGS)gammaproteobacteria_bar_plot%jpg\
$(FIGS)desulfobacterota_bar_plot%jpg : code/plot_community_bar_plot.R\
                                       code/plot_community_bar_plot_chloroplast.R\
                                       code/plot_community_bar_plot_cyanobacteria.R\
                                       code/plot_community_bar_plot_bacteroidota.R\
                                       code/plot_community_bar_plot_alphaproteobacteria.R\
                                       code/plot_community_bar_plot_gammaproteobacteria.R\
                                       code/plot_community_bar_plot_desulfobacterota.R\
                                       $(BASIC_STEM).pick.nr_v138.wang.tax.summary\
                                       $(RAW)metadata.csv\
                                       $(RAW)group_colors.csv
	R -e "source('code/plot_community_bar_plot.R')"
	R -e "source('code/plot_community_bar_plot_chloroplast.R')"
	R -e "source('code/plot_community_bar_plot_cyanobacteria.R')"
	R -e "source('code/plot_community_bar_plot_bacteroidota.R')"
	R -e "source('code/plot_community_bar_plot_alphaproteobacteria.R')"
	R -e "source('code/plot_community_bar_plot_gammaproteobacteria.R')"
	R -e "source('code/plot_community_bar_plot_desulfobacterota.R')"

# Construct a rarefaction plot
$(FIGS)rarefaction.jpg : $(BASIC_STEM).pick.pick.pick.opti_mcc.shared\
                         code/get_rarefaction_data.batch\
                         $(MOTHUR)\
                         code/plot_rarefaction.R\
                         $(RAW)metadata.csv
	$(MOTHUR) code/get_rarefaction_data.batch
	R -e "source('code/plot_rarefaction.R')"

# Plot richness, diversity calculators and similarity coefficients
$(FIGS)calculators%jpg\
$(FIGS)seasonal_shared%jpg : $(BASIC_STEM).pick.pick.pick.opti_mcc.shared\
                             code/plot_calculators.R\
                             code/plot_seasonal_shared.R\
                             $(RAW)metadata.csv
	R -e "source('code/plot_calculators.R')"
	R -e "source('code/plot_seasonal_shared.R')"

# Construct PCoA plots
$(FIGS)pcoa_figure.jpg : $(BASIC_STEM).pick.pick.pick.opti_mcc.shared\
                         code/plot_pcoa.R\
                         $(RAW)metadata.csv
	R -e "source('code/plot_pcoa.R')"

#########################################################################################
#
# Part 4: Combaine all together
#
# 	Render the manuscript
#
#########################################################################################

$(FINAL)manuscript.pdf\
$(FINAL)supplementary.pdf : $(MOTH)summary.txt\
                            $(BASIC_STEM).pick.pick.pick.error.summary\
                            $(FIGS)community_bar_plot.jpg\
                            $(FIGS)chloroplast_bar_plot.jpg\
                            $(FIGS)cyanobacteria_bar_plot.jpg\
                            $(FIGS)bacteroidota_bar_plot.jpg\
                            $(FIGS)alphaproteobacteria_bar_plot.jpg\
                            $(FIGS)gammaproteobacteria_bar_plot.jpg\
                            $(FIGS)desulfobacterota_bar_plot.jpg\
                            $(FIGS)rarefaction.jpg\
                            $(FIGS)calculators.jpg\
                            $(FIGS)seasonal_shared.jpg\
                            $(FIGS)pcoa_figure.jpg\
                            $(FINAL)manuscript.Rmd\
                            $(FINAL)header.tex\
                            $(FINAL)supplementary.Rmd\
                            $(FINAL)header_supplementary.tex\
                            $(FINAL)references.bib\
                            $(FINAL)citation_style.csl
	R -e 'render("$(FINAL)supplementary.Rmd", clean=FALSE)'
	mv $(FINAL)supplementary.knit.md $(FINAL)supplementary.md
	rm $(FINAL)supplementary.utf8.md
	R -e 'render("$(FINAL)manuscript.Rmd", clean=FALSE)'
	mv $(FINAL)manuscript.knit.md $(FINAL)manuscript.md
	rm $(FINAL)manuscript.utf8.md
	rm $(FINAL)*.log $(FINAL)*.out

# Cleaning
.PHONY: clean
clean :
	rm -f my_job.qsub.* || true
	rm -f $(REFS)tax* || true
	rm -f $(REFS)silva* || true
	rm -f $(MOTH)* || true
	rm -f data/summary.txt || true
	rm -f $(RAW)*.fastq || true
	rm -f $(RAW)names_file.txt || true
	rm -f $(RAW)raw.files || true
	rm -rf code/mothur/ || true
	rm -f $(FIGS)* || true
	rm -f mothur*logfile || true
