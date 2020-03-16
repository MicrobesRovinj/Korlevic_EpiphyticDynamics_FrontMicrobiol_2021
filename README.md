## Seasonal Dynamics of Epiphytic Microbial Communities on Marine Macrophyte Surfaces

### Overview

	project
	|- README                       # the top level description of content (this doc)
	|- CONTRIBUTING                 # instructions for how to contribute to your project
	|- LICENSE                      # the license for this project
	|
	|- submission/
	| |- manuscript.Rmd             # executable Rmarkdown for the manuscript of this study
	| |- manuscript.md              # Markdown (GitHub) version of the manuscript.Rmd file
	| |- manuscript.tex             # TeX version of manuscript.Rmd file
	| |- manuscript.pdf             # PDF version of manuscript.Rmd file
	| |- manuscript.aux             # auxiliary file of the manuscipt.tex file, used for cross-referencing
	| |- header.tex                 # LaTeX header file to format PDF version of manuscript
	| |- supplementary.Rmd          # executable Rmarkdown for the supplementary information of this study
	| |- supplementary.md           # Markdown (GitHub) version of the supplementary.Rmd file
	| |- supplementary.tex          # TeX version of supplementary.Rmd file
	| |- supplementary.pdf          # PDF version of supplementary.Rmd file
	| |- supplementary.aux          # auxiliary file of the supplementary.tex file, used for cross-referencing
	| |- header_supplementary.tex   # LaTeX header file to format PDF version of supplementary information
	| |- references.bib             # BibTeX formatted references
	| +- citation_style.csl         # csl file to format references
	|
	|- data                         # raw and primary data, are not changed once created
	| |- references/                # reference files to be used in analysis
	| |- raw/                       # raw data, will not be altered
	| |- mothur/                    # mothur processed data
	|
	|- code/                        # any programmatic code
	|
	|- results                      # all output from workflows and analyses
	| +- figures/                   # graphs, designated for manuscript or supplementary information figures
	|
	|-.gitignore                    # .gitinore file for this study
	|-Rprofile                      # .Rprofile file containing informaton on which R libraries to load,
	|                               # rendering options for knitr and Rmarkdown, functions etc.
	+- Makefile                     # executable Makefile for this study

### How to regenerate this repository

#### Dependencies and locations
* Gnu Make; should be located in the user's PATH
* mothur (v. 1.43.0)
* R (v. 3.6.0); should be located in the user's PATH
* R packages:
  * `knitr`
  * `rmarkdown`
  * "stats"
  * "knitr"
  * "rmarkdown"
  * "tinytex"
  * "tidyverse"
  * "vegan"
  * "RColorBrewer"
  * "kableExtra"

#### Running analysis
```
git clone https://github.com/mkorlevic/Korlevic_EpiphyticDynamics_EnvironMicrobiol_2020.git
make submission/manuscript.pdf
```

