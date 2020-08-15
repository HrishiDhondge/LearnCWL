#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: "Filter the templates"

doc: |
      This script takes list of PDB IDs generated by HHblits and filters the list based on 
      whether the structure has RRM fold or not.

baseCommand: [python]
stdout: template.pdb

inputs:
  List_Of_PDBs:
    type: File
    inputBinding:
      position: 1

outputs:
  Template:
    type: stdout
