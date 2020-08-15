#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: "Template search against PDB (HHblits)"
doc: |
      HHblits is an accelerated version of HHsearch that is fast enough to perform iterative 
      searches through millions of profile HMMs. HHblits allows up to 8 iterations, 
      which makes it more useful while finding distantly homologous sequences.
      
      HHblits can be installed with HH-suite using following manual:
      (https://github.com/soedinglab/hh-suite#installation).


baseCommand: [python]
stdout: List_Of_PDB_IDs
inputs:
  fasta:
    type: File
    inputBinding:
      position: 1

outputs: 
  List_of_PDB_IDs:
    type: stdout
    
