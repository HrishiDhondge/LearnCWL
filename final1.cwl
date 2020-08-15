#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

inputs:
  target_sequence(Fasta): File
  
outputs:
  DOPE_score_graph:
    type: File
    outputSource: model_evaluation/DOPE_score

  5_models:
    type: File
    outputSource: side-chain_fixing/fixed_models



steps:
  template_search:
    run: Tools/HHblits.cwl
    in:
      fasta: target_sequence(Fasta)
    out: [List_of_PDB_IDs]

  template_filtering:
    run: Tools/filter_templates.cwl
    in:
      List_Of_PDBs: template_search/List_of_PDB_IDs
    out: [Template]

  fasta2pir:
    run: Tools/fasta2pir.cwl
    in:
      fasta: target_sequence(Fasta)
    out: [pir]

  target-template_alignment:
    run: Tools/alignment.cwl
    in: 
      template.pdb: template_filtering/Template
      sequence_in_pir: fasta2pir/pir
    out: [alignment]

  backbone_generation:
    run: Tools/backbone.cwl
    in:
      alignment_file: target-template_alignment/alignment
    out: [model]

  side-chain_fixing:
    run: Tools/side_chain.cwl
    in:
      5_models: backbone_generation/model
    out: [fixed_models]

  model_evaluation:
    run: Tools/model_evaluation.cwl
    in:
      5_side-chain_fixed_models: side-chain_fixing/fixed_models
      template.pdb: template_filtering/Template
    out: [DOPE_score]
