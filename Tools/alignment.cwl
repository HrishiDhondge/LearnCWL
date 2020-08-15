#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: "Structure-Template alignment [Align2d()]"
doc: |
      Align2d() is based on a dynamic programming algorithm, it is different from 
      standard sequence-sequence alignment methods because it takes into account 
      structural information from the template when constructing an alignment.
      
      MODELLER can be installed using following manual:
      (https://salilab.org/modeller/download_installation.html).

baseCommand: [python]
stdout: target-temp.ali

inputs:
  sequence_in_pir:
    type: File
    inputBinding:
      position: 1
    label: Target sequence in PIR format

  template.pdb:
    type: File
    inputBinding:
      position: 2

outputs: 
  alignment:
    type: stdout
