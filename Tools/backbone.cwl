#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: "Backbone generation (MODELLER)"
doc: |
      MODELLER is used for homology or comparative modeling of protein three-dimensional 
      structures. The user provides an alignment of a sequence to be modeled with known 
      related structures and MODELLER automatically calculates a model containing all non-hydrogen atoms. 
      
      MODELLER can be installed using following manual:
      (https://salilab.org/modeller/download_installation.html).

baseCommand: [python]
stdout: models.pdb
inputs:
  alignment:
    type: File
    inputBinding:
      position: 1

outputs: 
  model:
    type: stdout
