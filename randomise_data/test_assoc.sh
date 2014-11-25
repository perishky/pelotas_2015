#!/bin/bash


# Perform GWAS on BMI, hypertension, CRP

plink1.90 --bfile geno --assoc --pheno phen.txt --mpheno 1 --covar covars.txt --out bmi
gcta64 --thread-num 10 --grm geno_hm3 --reml --reml-no-lrt --pheno phen.txt --mpheno 1 --out bmi
Rscript gwas_graphs.R bmi.qassoc BMI


plink1.90 --bfile geno --assoc --pheno phen.txt --mpheno 4 --covar covars.txt --out crp
gcta64 --thread-num 10 --grm geno_hm3 --reml --reml-no-lrt --pheno phen.txt --mpheno 4 --out crp
Rscript gwas_graphs.R crp.qassoc CRP


plink1.90 --bfile geno --assoc --pheno phen.txt --mpheno 5 --covar covars.txt --out hypertension
gcta64 --thread-num 10 --grm geno_hm3 --reml --reml-no-lrt --pheno phen.txt --mpheno 5 --out hypertension
R gwas_graphs.R hypertension.qassoc Hypertension
