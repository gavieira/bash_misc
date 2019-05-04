#Counts number of reads from fastq files
function readcount() {
	if [ $# -eq 0 ]; then
		echo "usage: readcount reads.fastq"
	else	
		for i in "$@"; do
			readnumber=$(wc -l "$i" | awk '{print $1"/4"}' | bc)
			file=$(wc -l "$i" | awk '{print $2}')
			echo -e $file'\t'$readnumber "reads"
		done
	fi
}

#Removes 'score' lines from seqin files
function remove_score_seqin {
	if [ $# -eq 0 ]; then
		echo "usage: remove_score_seqin annotation.seqin"
	else
		IFS=''
		while read line; do 
			if [[ '$line' =~ '^\s*score' ]]; then
				continue
			else
				echo $line
			fi
		done < $1
	fi
}

#Length of individual sequences in a multifasta file
multifasta_seqlen() {
	if [ $# -eq 0 ]; then
		echo "usage: multifasta_seqlen sequences.fasta"
	else	
		while read line; do
			if [[ "${line[0]}" =~ ">" ]] ; then
				echo -e $header"\t\t"$length
				length=0
				header=$line
				continue
			else
				let length=$((length+${#line}))
			fi
		done < $1
	fi
	echo -e $header"\t\t"$length
	unset header && unset length
}

#Sorts sequences from multifasta in increasing order of length
function multifasta_seqlen_increase {
	if [ $# -eq 0 ]; then
		echo "usage: multifasta_seqlen_increase sequences.fasta"
	else
		local increase=$(multifasta_seqlen $1 | sort -k3 -t $'\t')
		echo "$increase"
		#unset increase
	fi
}

#Sorts sequences from multifasta in decreasing order of length
function multifasta_seqlen_decrease {
	if [ $# -eq 0 ]; then
		echo "usage: multifasta_seqlen_decrease sequences.fasta"
	else
		local decrease=$(multifasta_seqlen $1 | sort -r -k3 -t $'\t')
		echo "$decrease"
		#unset decrease
	fi
}

#SRA files can be converted to fastq. Hence, when working with public data, keeping only the SRA files (generally smaller than fastq) can save up a significant ammount of hard disk space.
#So, this function recursively deletes all fastq files from a folder.
function remove_fastq {
	fastq=$(find . -name "*fastq" -type f); for i in $fastq; do ls -lh $i; done
}
