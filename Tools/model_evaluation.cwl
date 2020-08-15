#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: "Model Evaluation (DOPE score)"

doc: |
      DOPE (Discrete Optimized Protein Energy) scores were calculated on a per-residue 
      basis for each newly generated model and for the template and then plotted
      for visualization. DOPE score is calculated using MODELLER.
      The graph for DOPE scores was generated using python.

      MODELLER can be installed using following manual:
      (https://salilab.org/modeller/download_installation.html).


baseCommand: touch
stdout: DOPE-score_graph.png

inputs:
  5_side-chain_fixed_models:
    type: File
    inputBinding:
      position: 1
  template.pdb:
    type: File
    inputBinding:
      position: 2

outputs: 
  DOPE_score:
    type: stdout

