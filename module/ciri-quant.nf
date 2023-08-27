
process CQ_circRNA_finder {
    container 'ndatth/ciriquant:v1.0.1'
    publishDir "${params.outdir}/CQ_circRNA_finder", mode: 'copy', overwrite: true
    cpus 32
    memory '64 GB'
    
    
    input:
    
    tuple val(pair_id), path(reads)
    path res_circRNA
    

    output:
    path "${pair_id}.*"

    script:
    """
    CIRIquant -t 32 \
        -1 ${reads[0]} \
        -2 ${reads[1]} \
        --config $params.ciriquant_param \
        -o "." \
        -p ${pair_id} \
        --circ ${pair_id}.bed \
        --tool circRNA_finder \
        --no-gene

    rm -rf align
    rm -rf circ   
    """
}


process CQ_CIRI2 {
    container 'ndatth/ciriquant:v1.0.1'
    publishDir "${params.outdir}/CQ_CIRI2", mode: 'copy', overwrite: true
    cpus 32
    memory '64 GB'
    
    
    input:
    
    tuple val(pair_id), path(reads)
    path res_circRNA
    

    output:
    path "${pair_id}.*"

    script:
    """
    CIRIquant -t 32 \
        -1 ${reads[0]} \
        -2 ${reads[1]} \
        --config $params.ciriquant_param \
        -o "." \
        -p ${pair_id} \
        --circ ${pair_id}.ciri2 \
        --tool CIRI2 \
        --no-gene

    rm -rf align
    rm -rf circ   
    """
}

