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


#cd /mnt/project/Aqua-Faang/dat/cscqtl/tcell_cscQTL_dev


reads="/mnt/project/Aqua-Faang/dat/40t-cell/total_rnas/*_{1,2}.fastq.gz"

genotype="$PWD/data/tcel_hg38.vcf.gz"

# wget https://github.com/datngu/data/releases/download/v.0.0.2/tcel_hg38.vcf.gz -O "$PWD/data/tcel_hg38.vcf.gz"


meta='/mnt/ScratchProjects/Aqua-Faang/dat_projects/cscqtl_paper/data/meta_358_eur.csv'



#nextflow run main.nf -resume --outdir "EUR_358_samples" --reads $reads --genotype $genotype --meta $meta --consensus 3 --coloc true --circall true --ciri2 true --circexplorer2 true -with-report -profile cluster

nextflow run main.nf -resume --outdir "consensus_3" --reads $reads --genotype $genotype --consensus 3 --coloc true --circall true --ciri2 true --circexplorer2 true -profile cluster  -with-tower -with-report



