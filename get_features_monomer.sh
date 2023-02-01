#!/bin/bash

DATA_DIR=/lustre/home/xuyuxing/Program/alphafold/alphafold_db
uniref90_database_path=$DATA_DIR/uniref90/uniref90.fasta
uniprot_database_path=$DATA_DIR/uniprot/uniprot.fasta
mgnify_database_path=$DATA_DIR/mgnify/mgy_clusters_2022_05.fa
bfd_database_path=$DATA_DIR/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt
small_bfd_database_path=$DATA_DIR/small_bfd/bfd-first_non_consensus_sequences.fasta
uniref30_database_path=$DATA_DIR/uniref30/UniRef30_2021_03
pdb70_database_path=$DATA_DIR/pdb70/pdb70
pdb_seqres_database_path=$DATA_DIR/pdb_seqres/pdb_seqres.txt
template_mmcif_dir=$DATA_DIR/pdb_mmcif/mmcif_files
obsolete_pdbs_path=$DATA_DIR/pdb_mmcif/obsolete.dat

source activate alphafold
python /lustre/home/xuyuxing/python_project/AlphaFoldGetFeatures/run_alphafold.py \
    --uniref90_database_path=$uniref90_database_path \
    --mgnify_database_path=$mgnify_database_path \
    --data_dir=$DATA_DIR \
    --template_mmcif_dir=$template_mmcif_dir \
    --obsolete_pdbs_path=$obsolete_pdbs_path \
    --pdb70_database_path=$pdb70_database_path \
    --uniref30_database_path=$uniref30_database_path \
    --bfd_database_path=$bfd_database_path \
    --use_gpu_relax=True \
    --model_preset=monomer $*
conda deactivate