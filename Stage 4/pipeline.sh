# Define parameters
FORWARD="/home/chijioke/biocomputing/ngs_data/ERR8774458_1.fastq.gz"
REVERSE="/home/chijioke/biocomputing/ngs_data/ERR8774458_2.fastq.gz"
REFERENCE="/home/chijioke/biocomputing/ngs_data/Reference.fasta"
OUTDIR="/home/chijioke/biocomputing/ngs_data"

# Step 1: FastQC for quality control
echo "Running FastQC..."
fastqc $FORWARD -o $OUTDIR
fastqc $REVERSE -o $OUTDIR

# Step 2: Fastp for trimming and quality control
echo "Running Fastp..."
fastp -i $FORWARD -I $REVERSE -o $OUTDIR/out.R1.fq.gz -O $OUTDIR/out.R2.fq.gz

# Step 3: BWA index for reference genome
echo "Indexing reference genome with BWA..."
bwa index $REFERENCE

# Step 4: BWA mem for read alignment and Samtools for BAM conversion
echo "Aligning reads with BWA mem and converting to BAM..."
bwa mem $REFERENCE $OUTDIR/out.R1.fq.gz $OUTDIR/out.R2.fq.gz | samtools view -Sb - > $OUTDIR/out.bam

# Step 5: Sort BAM file using Samtools
echo "Sorting BAM file..."
samtools sort $OUTDIR/out.bam -o $OUTDIR/out_sorted.bam

# Step 6: Generate mpileup with Bcftools and call variants
echo "Generating mpileup and calling variants with Bcftools..."
bcftools mpileup -f $REFERENCE $OUTDIR/out_sorted.bam | bcftools call -mv -Ov -o $OUTDIR/var.vcf

echo "Pipeline completed successfully. Output files are in $OUTDIR."

