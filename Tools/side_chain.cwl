#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: "Side-chain fixing (SCWRL4)"
doc: |
      SCWRL4 uses a backbone-dependent rotamer library based on kernel density estimates, 
      which provide sample conformations that are consistent with the observed conformation 
      of side-chains in proteins.

      SCWRL4 can be installed from the following website:
      (http://dunbrack.fccc.edu/SCWRL3.php/#installation)

baseCommand: [python]
stdout: side_chain_fixed_models.pdb
inputs:
  models:
    type: File
    inputBinding:
      position: 1

outputs: 
  fixed_models:
    type: stdout
