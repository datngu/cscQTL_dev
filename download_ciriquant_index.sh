# run after bwa index

wget https://genome-idx.s3.amazonaws.com/hisat/grch38_tran.tar.gz -O data/grch38_tran.tar.gz
cd data
tar xvf grch38_tran.tar.gz
cd ..

# soft link genome to index soft link dir
ln -s $PWD/data/ref/genome.fa $PWD/trace_dir/bwa_index/genome.fa