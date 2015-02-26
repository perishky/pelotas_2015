Data and scripts for practicals
===============================

This repository contains instructions, bits of data, and scripts for each of the practicals:

- Genome wide association studies (`gwas`)
- Imputation (`imputation`)
- Whole genome methods (`whole_genome`)
- Mendelian randomisation (`mr`)

The guide to each of the practicals are in the README files in each of the respective directories. Slides and references for the course can be downloaded from [here]().

To get set up, first thing to do is clone it into your home directory. Log on to the cluster and type:

    git clone https://github.com/explodecomputer/pelotas_2015.git

It will download all the files in this repo, about 20Mb in total. The next thing to do is copy the necessary executables into your home directory so that it is visible on your path:

    cp -r pelotas_2015/bin ~/

There is a file in `pelotas_2015/` called `config`. This is to point to the directory containing the genotype data (currently `/pelotas_data/`). In the data directory there are also pre-computed results for some of the more computationally demanding routines, so if they are running slowly during the practical then no problem just pick up the results from here.

The folder `pelotas_2015/data` has the scripts that were used to simulate the phenotype data, take a look if you are interested.

Each practical has its own folder within `pelotas_2015/`. If you navigate to the folder on the github website then the README should show up, outlining the instructions etc for that practical.

If changes are made by the owner of this repository you can sync them to your local copy by running the command

    git pull

Finally, it is possible to copy this into your own github repository where you will have the ability to save your changes etc. Just ask how to go about doing this if you're not sure.
