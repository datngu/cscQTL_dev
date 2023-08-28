cd /net/fs-2/scale/OrionStore/Projects/Aqua-Faang/dat/cscqtl/tcell_cscQTL_dev/work/9d/b27865cbff9dd1d21672237fa7a46d

# qlogin --mem=32g --partition=orion --ntasks=16

export SINGULARITY_BIND="/tmp:/tmp, /mnt:/mnt"

singularity shell /net/fs-2/scale/OrionStore/Projects/Aqua-Faang/dat/cscqtl/tcell_cscQTL_dev/work/singularity/ndatth-ciriquant-v1.0.1.img


index=/mnt/project/Aqua-Faang/dat/cscqtl/tcell_cscQTL_dev/data/grch38_tran/genome_tran
hisat2 --dta -x $index -1 EGAR00001193022_1.fastq.gz -2 EGAR00001193022_2.fastq.gz -S output.sam