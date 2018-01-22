#!/bin/bash

# Create a reproducible environments as the one used in the study
# Install software and dependencies

# ensure pwd is the cloned repository
result=${PWD##*/}
if [ "$result" != "2018_methane_growing_steers" ]
then
	printf "\nCurrent directory is not the cloned repository.\nSee https://github.com/enriquepaz/2018_methane_growing_steers for details.\n\n"
	exit 1
fi

#download and install miniconda 
wget https://repo.continuum.io/miniconda/Miniconda3-4.3.21-Linux-x86_64.sh
bash Miniconda3-4.3.21-Linux-x86_64.sh -b -p anaconda
rm Miniconda3-4.3.21-Linux-x86_64.sh

#Create environments
anaconda/bin/conda create -y -n bioinfo --file setup/qiime_lefse_pkgs.txt -c bioconda -c r -c biobuilds

#activate environment
source anaconda/bin/activate bioinfo

#install
wget https://github.com/mothur/mothur/releases/download/v1.39.5/Mothur.linux_64.zip
unzip Mothur.linux_64.zip
mv mothur/mothur anaconda/envs/bioinfo/bin/
mv mothur/vsearch anaconda/envs/bioinfo/bin/
rm Mothur.linux_64.zip
rm -r mothur
rm -r __MACOSX

#install
mkdir fastx2
cd fastx2
wget http://hannonlab.cshl.edu/fastx_toolkit/fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2
bzip2 -d fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2
tar -xvf fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar
cd ..
mv fastx/bin/* anaconda/envs/bioinfo/bin/
rm -rf fastx

source deactivate

anaconda/bin/conda create -y -n stats --file setup/r_pkgs.txt -c bioconda -c r -c biobuilds

#sra 
wget ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz
tar -xzf sratoolkit.current-centos_linux64.tar.gz
rm sratoolkit.current-centos_linux64.tar.gz
