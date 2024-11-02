    1  sudo apt update
    2  mkdir chijioke001
    3  ls
    4  mkdir biocomputing 
    5  ls
    6  cd¬/biocomputing
    7  cd biocomputing
    8  wget 
    9  wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
   10  wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
   11  ls
   12  mv wildtype.fna chijioke001
   13  cd ~/chijioke001
   14  ls
   15  cd ~/biocomputing
   16  ls
   17  rm wildtype.gbk.1
   18  ls
   19  cd
   20  ls
   21  cd biocomputing
   22  ls
   23  cd ~/chijioke001
   24  ls
   25  fn wildtype.fna
   26  cd 
   27  find wildtype.fna
   28  cd chijioke001
   29  wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
   30  $ #!/bin/bash
   31  file="wildtype.fna"
   32  # Search for 'tatatata' (mutant) and 'tata' (wildtype)
   33  mutant_count=$(grep -o "tatatata" "$file" | wc -l)
   34  wildtype_count=$(grep -o "tata" "$file" | wc -l)
   35  # Output results
   36  if [ $mutant_count -gt 0 ]; then   echo "The file is likely from a mutant because it contains 'tatatata' sequence."; elif [ $wildtype_count -gt 0 ]; then   echo "The file is likely from a wildtype because it contains the 'tata' sequence."; else   echo "No 'tata' or 'tatatata' sequence found in the file."; fi
   37  $   #!/bin/bash
   38  main_file="wildtype.fna"
   39  # Output file to store the mutant lines
   40  output_file="mutant_sequences.fna"
   41  # Search for lines containing 'tatatata' and write them to the output file
   42  grep "tatatata" "$main_file" > "$output_file"
   43  # Confirm the output file is created and lines are saved
   44  if [ -s "$output_file" ]; then   echo "Mutant sequences found and saved to '$output_file'."; else   echo "No mutant sequences found."; fi
   45  ls
   46  #!/bin/bash
   47  # Define the gene name and organism (adjust for your organism of interest)
   48  gene_name="gyrA"
   49  organism="Escherichia coli"
   50  # Define the output file name
   51  output_file="gyrA_gene.fasta"
   52  # Ensure Entrez Direct tools are installed
   53  if ! command -v esearch &> /dev/null; then     echo "Entrez Direct tools (edirect) are not installed. Please install them first.";     exit 1; fi
   54  #!/bin/bash
   55  # Define the gene name and organism (adjust for your organism of interest)
   56  gene_name="gyrA"
   57  organism="Escherichia coli"
   58  # Define the output file name
   59  output_file="gyrA_gene.fasta"
   60  # Ensure Entrez Direct tools are installed
   61  if ! command -v esearch &> /dev/null; then     echo "Entrez Direct tools (edirect) are not installed. Please install them first.";     exit 1; fi
   62  cd chijioke001
   63  ls
   64  head gyra_gene.fasta
   65  esearch -db nucleotide -query "gyrA [gene] AND Escherichia coli [orgn]" | efetch -format fasta > gyrA_sequence.fasta
   66  # For Debian-based systems
   67  sudo apt-get install entrez-direct
   68  esearch -db nucleotide -query "NC_000913.3" | efetch -format fasta > gene_sequence.fasta
   69  sudo apt install ncbi-entrez-direct
   70  cd chijioke001
   71  esearch -db nucleotide -query "NC_000913.3" | efetch -format fasta > gene_sequence.fasta
   72  #!/bin/bash
   73  # Define the gene accession number (replace with the actual accession number)
   74  accession_number="NC_000913.3"  # Example for E. coli genome; replace with your gene accession number
   75  # Define the output file name
   76  output_file="gene_sequence.fasta"
   77  # Ensure Entrez Direct tools are installed
   78  if ! command -v esearch &> /dev/null; then     echo "Entrez Direct tools (edirect) are not installed. Please install them first.";     exit 1; fi
   79  # Search for the gene and download the FASTA format
   80  echo "Searching for accession number: $accession_number"
   81  esearch -db nucleotide -query "$accession_number" | efetch -format fasta > "$output_file"
   82  # Confirm if the file was created and contains data
   83  if [ -s "$output_file" ]; then     echo "FASTA file for accession number '$accession_number' has been downloaded and saved to '$output_file'."; else     echo "Failed to download the FASTA file or no data found."; fi
   84  #!/bin/bash
   85  # Define the gene name and organism (adjust for your organism of interest)
   86  gene_name="gyrA"
   87  organism="Escherichia coli"
   88  # Define the output file name
   89  output_file="gyrA_gene.fasta"
   90  # Ensure Entrez Direct tools are installed
   91  if ! command -v esearch &> /dev/null; then     echo "Entrez Direct tools (edirect) are not installed. Please install them first.";     exit 1; fi
   92  # Search NCBI for the gene in the specified organism and fetch the sequence in FASTA format
   93  esearch -db nucleotide -query "$gene_name [gene] AND $organism [orgn]" | efetch -format fasta > "$output_file"
   94  # Check if the download was successful
   95  if [ -s "$output_file" ]; then     echo "FASTA file for $gene_name in $organism has been downloaded and saved to '$output_file'."; else     echo "Failed to download the FASTA file or no data found."; fi
   96  esearch -db nucleotide -query "gyrA [gene] AND Escherichia coli [orgn]" | efetch -format fasta > gyrA_sequence.fasta
   97  esearch -db nucleotide -query "NC_000913.3" | efetch -format fasta > gene_sequence.fasta
   98  ls
   99  gyra_gene.fasta > chijioke001
  100  cd chijioke001
  101  ls
  102  cd ~/biocomputing
  103  ls
  104  mv wildtype.gbk chijioke001
  105  ls
  106  cd chijioke001
  107  cd ~
  108  cd chijioke001
  109  cd ~/biocomputin
  110  cd ~/biocomputing
  111  cd chijioke001
  112  ls
  113  nano chijioke001
  114  cd chijioke001
  115  ls
  116  cd
  117  cd chijioke
  118  ls
  119  cp gyra.fasta chijioke001
  120  cd chijioke001
  121  ls
  122  # Count the number of non-header lines (excluding lines starting with ">")
  123  line_count=$(grep -v "^>" "gyra.fasta" | wc -l)
  124  # Print the result
  125  echo "The number of non-header lines in gyra.fasta is: $line_count"
  126  head gyra.fasta
  127  # Count the occurrences of "A" (excluding header lines)
  128  a_count=$(grep -v "^>" "gyra.fasta" | tr -cd 'A' | wc -c)
  129  # Print the result
  130  echo "The number of times 'A' appears in gyra.fasta is: $a_count"
  131  # Count the occurrences of "A" (excluding header lines)
  132  g_count=$(grep -v "^>" "gyra.fasta" | tr -cd 'G' | wc -c)
  133  # Print the result
  134  echo "The number of times 'G' appears in gyra.fasta is: $g_count"
  135  # Count the occurrences of "C" (excluding header lines)
  136  c_count=$(grep -v "^>" "gyra.fasta" | tr -cd 'C' | wc -c)
  137  # Print the result
  138  echo "The number of times 'C' appears in gyra.fasta is: $c_count"
  139  # Count the occurrences of "T" (excluding header lines)
  140  t_count=$(grep -v "^>" "gyra.fasta" | tr -cd 'T' | wc -c)
  141  # Print the result
  142  echo "The number of times 'T' appears in gyra.fasta is: $t_count"
  143  # Extract the sequence (excluding header lines)
  144  sequence=$(grep -v "^>" "gyra.fasta")
  145  # Count the occurrences of G and C
  146  g_count=$(echo "$sequence" | tr -cd 'G' | wc -c)
  147  c_count=$(echo "$sequence" | tr -cd 'C' | wc -c)
  148  # Count the total number of bases (A, T, G, C)
  149  total_bases=$(echo "$sequence" | tr -cd 'ATGC' | wc -c)
  150  # Calculate GC content percentage
  151  gc_content=$(echo "scale=2; (($g_count + $c_count) / $total_bases) * 100" | bc)
  152  # Print the result
  153  echo "The GC content of the gene in gyra.fasta is: $gc_content%"
  154  # Specify the output file name
  155  output_file="chijioke.fasta"
  156  # Create the FASTA header
  157  echo ">Chijioke_Sequence" > $output_file
  158  # Add the nucleotide sequence (you can modify the sequence as needed)
  159  echo "The number of A is 645" >> $output_file
  160  echo "The number of G is 757" >> $output_file
  161  echo "The number of C is 662" >> $output_file
  162  echo "The number of T is 564" >> $output_file
  163  echo "The %GC content is 53.0%" >> $output_file
  164  # Confirm creation of the file
  165  echo "Nucleotide FASTA file created: $output_file"
  166  cat chijioke.fasta
  167  history > chijioke.sh
  168  cd
  169  history > chijioke.sh
  170  # Specify the output file name
  171  output_file="chijioke.sh"
  172  history > $output_file
