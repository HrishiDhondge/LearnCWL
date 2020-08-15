#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: "Format conversion Fasta to PIR"
doc: |
      Script to convert fasta sequence to PIR format

baseCommand: [python]
stdout: target.ali
inputs:
  fasta:
    type: File
    inputBinding:
      position: 1

outputs: 
  pir:
    type: stdout
