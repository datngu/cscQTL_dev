
process circRNA_FINDER_pipeline {
    container 'ndatth/rna-tools:v0.0.0'
    publishDir "${params.outdir}/circRNA_finder", mode: 'copy', overwrite: true
    memory '8 GB'
    
    input:
    tuple val(pair_id), path("${pair_id}.bam"), path("${pair_id}.junction"),  path("${pair_id}SJ.out.tab"), path("${pair_id}Chimeric.out.sam")

    output:
    path("${pair_id}.bed")

    script:
    """
    mkdir circRNA_finder
    circRNA_finder_postProcessStarAlignment.pl --starDir ./ --outDir circRNA_finder/
    mv circRNA_finder/*_filteredJunctions.bed ${pair_id}.bed
    rm -rf circRNA_finder
    """
}