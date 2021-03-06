Whole genome methods practical
==============================

## Background

The use of very simple, single SNP approaches have actually been very successful in genetic studies. However, with the introduction of whole genome methods the scope of what we might be able to learn from genetic data has broadened significantly. Here we'll look at some of the fundamentals.

The purpose of GWAS is to identify particular SNPs that we are certain have an influence on a trait. In contrast, the purpose of a GCTA style 'GREML' (Genetic REML) or 'SNP heritability' analysis is to estimate how much of the variance of the phenotype can be explained by all the measured SNPs in our data.

The SNP heritability is estimated using a two step procedure. First a genetic covariance matrix, or genetic relationship matrix (GRM) is estimated. This is an *n* x *n* matrix where each element represents the genetic similarity of two individuals. The second step performs REML analysis to essentially estimate how much of the phenotypic covariance in the population is attributable to genetic covariance. 


## A note about software

The original implementation for large scale human data is [GCTA](http://www.complextraitgenomics.com/software/gcta/). It is continually improving, and it has a huge number of features. We will use this to perform REML estimation of heritabilities. It also constructs genetic relationship matrices, which is something that we need, but we will use [Plink2](https://www.cog-genomics.org/plink2/) to do this, as it does the same implementation but much faster.


## Using SNPs to estimate kinship

How far removed must two individuals be from one another before they are considered 'unrelated'? We can make estimates of the proportion of the genome that is shared identical by descent (IBD) between all pairs of seemingly unrelated individuals from the population by calculating the proportion of SNPs that are identical by state (IBS). 

The result is a genetic relationship matrix (GRM, aka kinship matrix) of size *n* x *n*, diagonals are estimates of an individual's inbreeding and off-diagonals are an estimate of genomic similarity for pairs of individuals.


## Using kinships to estimate heritability

See slides for more accurate treatment, but the intuition is as follows. Heritability is the measure of the proportion of variation that is due to genetic variation. If individuals who are more phenotypically similar also tend to be more genetically similar then this is evidence that heritability is non-zero. We can make estimates of heritability by comparing these similarities.

When genetic similarity is calculated by using SNPs then we are no longer estimating heritability per se, we are instead estimating how much of the phenotypic variance can be explained by all the SNPs in our model.

## Setup

Update the repository

    cd ~/pelotas_2015
    git pull


Make sure that the QC'd phenotype and covariate file from the GWAS are available in `../../gwas/data`. If not run:

    cd ~/pelotas_2015/gwas/scripts/
    R --no-save < qc.R

This will generate the files `~/pelotas_2015/gwas/data/phen.txt` and `~/pelotas_2015/gwas/data/covs.txt`.

## Exercises

1. 	Construct the genetic relationship matrix using the QC'd SNPs in the `geno_qc` data:

        cd ~/pelotas_2015/whole_genome/scripts
        ./construct_grm.sh

	If this is running slowly then you can use pre-computed GRMs. Copy `geno_qc.grm.bin`, `geno_qc.grm.id` and `geno_qc.grm.N` from shared space:

	    cp /pelotas_data/whole_genome/geno_qc.grm* ~/pelotas_2015/whole_genome/data/


2. 	Calculate SNP heritabilities with and without covariates. What are the SNP heritabilities for each of the traits and how do the estimates differ when covariates are not included? Use the commands in `estimate_heritability.sh` to do this.


3. 	We have now calculated a genetic relationship value for every pair of individuals. If the sample comprises only 'unrelated' individuals then each pair of individuals should have a genetic relationship less than 0.05 (and a relationship with themselves of approximately 1). Use the `analyse_grm.R` script to read in the GRM files into R and plot the distribution of relationships. 

	Why is it important to make sure that related individuals are not included in this analysis?


4. 	In addition to estimating the SNP heritability of each trait, we can calculate how similar the genetic effects are for a pair of traits, also known as the genetic correlation. Perform bivariate GREML analysis to calculate genetic correlations between each pair of traits. Use the commands in `estimate_heritability.sh` to do this.

5. 	Construct two GRMs, one using chromosomes 1-8 and another using 9-22. Estimate the heritability of each GRM separately and both combined. Do this with and without covariates included. Is the sum of heritabilities for each chromosome the same as that for the entire genome? Use the commands in `grm_partitioning.sh` to do this.
