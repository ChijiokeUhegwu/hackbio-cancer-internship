Proposed Pipeline for NGS analysis
Download dataset (wget) => Quality Control (FastQC) => Trimming (FastP) => Genome Mapping (bwa) => Variant Calling (bcftools)

# 1. download the files directly to the folder titled ngs_main
wget -P ngs_main https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/ACBarrie_R1.fastq.gz
wget -P ngs_main https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/ACBarrie_R2.fastq.gz

wget -P ngs_main https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Alsen_R1.fastq.gz
wget -P ngs_main https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Alsen_R2.fastq.gz

wget -P ngs_main https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Baxter_R1.fastq.gz
wget -P ngs_main https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Baxter_R2.fastq.gz

wget -P ngs_main https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Chara_R1.fastq.gz
wget -P ngs_main https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Chara_R2.fastq.gz

wget -P ngs_main https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Drysdale_R1.fastq.gz
wget -P ngs_main https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Drysdale_R2.fastq.gz

# 2. Run FastQC on all the raw fastq.gz files in the ngs_main folder to check for the quality of the files
fastqc ngs_main/*.fastq.gz 
 
# 3. Run MultiQC on all the raw fastq.gz files in the ngs_main folder to check for the quality of the files
multiqc ngs_main/*_fastqc.zip

# 4. Run FastP on all the raw fastq.gz files in the ngs_main folder to trim and repair the data and output in the folder "qc_reads"
#!/bin/bash
mkdir qc_reads
SAMPLES=(
  "ACBarrie"
  "Alsen"
  "Baxter"
  "Chara"
  "Drysdale"
)

for SAMPLE in "${SAMPLES[@]}"; do

  # Repair mismatched reads first
  repair.sh in1="${SAMPLE}_R1.fastq.gz" in2="${SAMPLE}_R2.fastq.gz" out1="qc_reads/${SAMPLE}_R1_repaired.fastq.gz" out2="qc_reads/${SAMPLE}_R2_repaired.fastq.gz"

  # Run fastp on the repaired files
  fastp \
    -i "qc_reads/${SAMPLE}_R1_repaired.fastq.gz" \
    -I "qc_reads/${SAMPLE}_R2_repaired.fastq.gz" \
    -o "qc_reads/${SAMPLE}_R1.fastq.gz" \
    -O "qc_reads/${SAMPLE}_R2.fastq.gz" \
    --html "qc_reads/${SAMPLE}_fastp.html" 
done
 
# 5. Create a folder "repaired_reads" and move all the repaired.fastq.gz files there
# this folder should also contain your reference genome 
mkdir repaired_reads

# 6. Index the reference genome
bwa index reference.fasta


# 7. Proceed to execute this script for the genome mapping of the repaired.fastq.gz files to the reference genome
#!/bin/bash

# Paths
REF_GENOME="reference.fasta"
SAMPLES=( "ACBarrie" "Alsen" "Baxter" "Chara" "Drysdale" )

# Create output directory for BWA if it doesn't exist
mkdir bwa_output

# Loop through each sample and perform mapping using the repaired reads
for SAMPLE in "${SAMPLES[@]}"; do
    echo "Running BWA mapping for $SAMPLE..."
    
    # Mapping with BWA and generating a SAM file using the repaired reads
    bwa mem "$REF_GENOME" ${SAMPLE}_R1_repaired.fastq.gz ${SAMPLE}_R2_repaired.fastq.gz > bwa_output/${SAMPLE}.sam
    
    # Convert SAM to BAM
    samtools view -bS bwa_output/${SAMPLE}.sam > bwa_output/${SAMPLE}.bam
    
    # Sort the BAM file
    samtools sort bwa_output/${SAMPLE}.bam -o bwa_output/${SAMPLE}.sorted.bam
    
    # Index the sorted BAM file
    samtools index bwa_output/${SAMPLE}.sorted.bam

    echo "$SAMPLE mapping complete."
done

echo "BWA mapping complete for all samples."

7. # Variant calling of the samples
#!/bin/bash

# Paths
REF_GENOME="reference.fasta"
SAMPLES=( "ACBarrie" "Alsen" "Baxter" "Chara" "Drysdale" )

# Create output directory for variant calling
mkdir -p variant_output

# Loop through each sample and perform variant calling using the mapped BAM files
for SAMPLE in "${SAMPLES[@]}"; do
    echo "Performing variant calling for $SAMPLE..."
    
    # Generate mpileup with bcftools and call variants
    bcftools mpileup -Ou -f "$REF_GENOME" bwa_output/${SAMPLE}.sorted.bam | \
    bcftools call -mv -Oz -o variant_output/${SAMPLE}.vcf.gz
    
    # Index the VCF file
    bcftools index variant_output/${SAMPLE}.vcf.gz

    echo "Variant calling complete for $SAMPLE."
done

echo "Variant calling complete for all samples."
