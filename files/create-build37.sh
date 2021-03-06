#!/usr/bin/bash

# Create the output directory using the CGATools User Guide naming convention
mkdir ref

# The below command does the following:
# 1. User samtools to extract chr1-chr22,chrX,chrY (from UCSC hg19)
# 2. Appends chrM from NC_012920.1 to the output of the above
# 3. Pipes this reassembled fasta stream to `cgatools fasta2crr`,
#    which creates a build37.crr file.

samtools faidx hg19.fa.gz \
    $(seq -f "chr%g" 1 22) chrX chrY \
    | cat - <(cat chrM.fa) \
    | gzip > ref/build37.fa.gz
