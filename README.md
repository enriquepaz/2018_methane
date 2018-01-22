:computer: :bar_chart:
Analyses to recreate the results in the manuscript **"XXX"** by XXX et al. 2018 in XXX. The analyses are setup to run in a Linux environment and are separated into several R Markdown files.

## Create environments

Setup the same environments used to analyze the data by cloning the GitHub repository and running the setup.sh script as follows:

- git clone https://github.com/enriquepaz/2018_methane_growing_steers.git
- cd 2018_methane_growing_steers
- bash setup.sh

## Render R Markdown files

Adhere to the delineated order as succeeding R Markdown files depend on previous results. X11 forwarding may be needed if working remotely.

    1. data_curation.Rmd
	2. fasta_demux_qc.Rmd
	3. otu_tables.Rmd
	4. tax_align_bact.Rmd
	5. tax_align_arch.Rmd
	6. bact_rarefaction_alpha_diversity.Rmd
	7. arch_rarefaction_alpha_diversity.Rmd
	8. bact_taxa_beta_diversity.Rmd
    9. arch_taxa_beta_diversity.Rmd
    10. discovery_samples.Rmd
    11. bact_differential_otus.Rmd
    12. arch_differential_otus.Rmd
    13. bact_forward_regression.Rmd
    14. arch_forward_regression.Rmd

To render an R markdown file: 

- change to the 2018_methane_growing_steers directory 
- source anaconda/bin/activate bioinfo
- anaconda/envs/stats/bin/Rscript -e "rmarkdown::render('**_file[1-14].Rmd_**')"

