# Configure seqOutBias assets

`seqOutBias` is an optional tool that can be used to correct for enzymatic (e.g. Tn5 transposase) bias and generate stranded bigWigs for visualization [^Martins2018]. The bias itself is corrected using a kmer mask for the plus and minus strand Tn5 recognition sites and by taking the ratio of genome-wide observed read counts to the expected sequence based counts for each k-mer [^Martins2018]. The k-mer counts take into account mappability at a given read length using GenomeTools’ `Tallymer` program [^Kurtz2008]. 

To successfully use `seqOutBias` therefore requires some additional `refgenie` assets: the `tallymer_index` and the `suffixerator_index`. To generate the indexed k-mers (`tallymer_index`) for a sample requires an enhanced suffix array (`suffixerator_index`) for your primary alignment genome. The corresponding k-mer index is produced using this enhanced suffix array for the *specific read length* of your library.  This means you need separate k-mer indicies for every read length of your samples of interest, should they be different across samples. 

For example, a sample of interest is read length 75 and it's to be aligned to human genome, hg38.  You need to tag the `tallymer_index` with the read length, as the pipeline looks for the specific read length tagged tallymer index when using `seqOutBias`.

First, we'll create the enhanced suffix array. This asset only needs to be produced once for a genome.  For larger genomes (e.g. human), this can require significant amounts of memory (24GB+) to complete in a reasonable time, somewhere around an hour.

```console
refgenie build hg38/suffixerator_index --params memlimit=24GB
```

Once the `suffixerator_index` is complete, we can generate the `tallymer_index` for read length 75 with which we'll tag the asset.  This is much faster to complete than the `suffixerator_index`.

```console
refgenie build hg38/tallymer_index:75 --params mersize=75
```

Now you'd be all set to run the pipeline using `seqOutBias` (argument: `--sob`) to correct for enzymatic biases.



[^Martins2018]: Martins AL, Walavalkar NM, Anderson WD, Zang C, Guertin MJ. Universal correction of enzymatic sequence bias reveals molecular signatures of protein/DNA interactions. *Nucleic Acids Res.* 2018;46(2):e9. doi:10.1093/nar/gkx1053

[^Kurtz2008]: Kurtz S, Narechania A, Stein JC, Ware D. A new method to compute K-mer frequencies and its application to annotate large repetitive plant genomes. *BMC Genomics* 2008;9:517.
