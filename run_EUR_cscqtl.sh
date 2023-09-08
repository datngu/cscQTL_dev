#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --nodes=1                
#SBATCH --job-name=cscQTL
#SBATCH --mem=4G
#SBATCH --partition=gpu                
#SBATCH --mail-user=nguyen.thanh.dat@nmbu.no
#SBATCH --mail-type=ALL


module load git/2.23.0-GCCcore-9.3.0-nodocs
module load Nextflow/21.03
module load singularity/rpm

export TOWER_ACCESS_TOKEN=eyJ0aWQiOiA3OTAxfS4xNGY5NTFmOWNiZmEwNjZhOGFkYzliZTg3MDc4YWI4ZTRiYTk4ZmI5
export NXF_SINGULARITY_CACHEDIR=/mnt/users/ngda/sofware/singularity


cd /mnt/project/Aqua-Faang/dat/cscqtl/cscQTL_dev


reads="/mnt/ScratchProjects/Aqua-Faang/dat_projects/cscqtl_paper/data/filtered_rna_seq/*_{1,2}.fastq.gz"

genotype='/mnt/ScratchProjects/Aqua-Faang/dat_projects/cscqtl_paper/data/all_eur_hg38.vcf.gz'

meta='/mnt/ScratchProjects/Aqua-Faang/dat_projects/cscqtl_paper/data/meta_358_eur.csv'



#nextflow run main.nf -resume --outdir "EUR_358_samples" --reads $reads --genotype $genotype --meta $meta --consensus 3 --coloc true --circall true --ciri2 true --circexplorer2 true -with-report -profile cluster

nextflow run main.nf -resume --outdir "EUR_358_samples" --reads $reads --genotype $genotype --meta $meta --consensus 3 --coloc true --bsj_filter 1 -profile cluster  -with-tower -with-report



