# Pull base image
FROM phusion/baseimage:0.10.1

# Who maintains this image
LABEL maintainer Jason Smith "jasonsmith@virginia.edu"

# Version info
LABEL version 0.8.4

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes \    
    curl \
    default-jre \
    default-jdk \
    git \
    libcommons-math3-java \
    libcurl4-gnutls-dev \ 
    libjbzip2-java \
    libpng-dev \
    libssl-dev \
    libtbb2 \
    libtbb-dev \
    openssl \
    pigz \
    python \
    python-pip python-dev build-essential \
    wget

# Install MySQL server
RUN DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes mysql-server \
    mysql-client \
    libmysqlclient-dev
    
# Install python tools
RUN pip install --upgrade pip
RUN pip install virtualenv && \
    pip install numpy && \
    pip install MACS2 && \
    pip install pandas && \
    pip install pararead && \
    pip install piper

# Install R
RUN DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install r-base r-base-dev && \
    echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile && \    
    Rscript -e "install.packages('argparser')" && \
    Rscript -e "install.packages('devtools')" && \
    Rscript -e "devtools::install_github('pepkit/pepr')" && \    
    Rscript -e "install.packages('data.table')" && \
    Rscript -e "source('https://bioconductor.org/biocLite.R')" && \
    Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('GenomicRanges')" && \
    Rscript -e "devtools::install_github('databio/GenomicDistributions')" && \
    Rscript -e "install.packages('ggrepel')" && \
    Rscript -e "install.packages('ggplot2')" && \  
    Rscript -e "install.packages('gplots')" && \
    Rscript -e "install.packages('grid')" && \    
    Rscript -e "install.packages('gtable')" && \
    Rscript -e "install.packages('scales')" && \
    Rscript -e "install.packages('stringr')"


# Install bedtools
RUN DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes \
    ant \
    bedtools
    
# Install fastqc
WORKDIR /home/tools/
RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip && \
    unzip fastqc_v0.11.7.zip && \
    cd /home/tools/FastQC && \
    chmod 755 fastqc && \ 
    ln -s /home/tools/FastQC/fastqc /usr/bin/
    
# Install htslib
WORKDIR /home/src/
RUN wget https://github.com/samtools/htslib/releases/download/1.7/htslib-1.7.tar.bz2 && \
    tar xf htslib-1.7.tar.bz2 && \
    cd /home/src/htslib-1.7 && \
    ./configure --prefix /home/tools/ && \
    make && \
    make install

# Install samtools
WORKDIR /home/src/
RUN wget https://github.com/samtools/samtools/releases/download/1.7/samtools-1.7.tar.bz2 && \
    tar xf samtools-1.7.tar.bz2 && \
    cd /home/src/samtools-1.7 && \
    ./configure && \
    make && \
    make install && \
    ln -s /home/src/samtools-1.7/samtools /usr/bin/

# Install bowtie2
WORKDIR /home/src/
RUN wget https://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.3.4.1/bowtie2-2.3.4.1-source.zip && \
    unzip bowtie2-2.3.4.1-source.zip && \
    cd /home/src/bowtie2-2.3.4.1 && \
    make && \
    make install && \
    ln -s /home/src/bowtie2-2.3.4.1/bowtie2 /usr/bin/

# Install picard
WORKDIR /home/tools/bin
RUN wget https://github.com/broadinstitute/picard/releases/download/2.18.0/picard.jar && \
    chmod +x picard.jar

# Install UCSC tools
WORKDIR /home/tools/
RUN wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig && \
    wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/wigToBigWig && \
    wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigCat && \
    wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bedSort && \
    wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed && \
    chmod +x /home/tools/bedGraphToBigWig && \
    chmod +x /home/tools/wigToBigWig && \
    chmod +x /home/tools/bigWigCat && \
    chmod +x /home/tools/bedSort && \
    chmod +x /home/tools/bedToBigBed && \
    ln -s /home/tools/bedGraphToBigWig /usr/bin/ && \
    ln -s /home/tools/wigToBigWig /usr/bin/ && \
    ln -s /home/tools/bigWigCat /usr/bin/ && \
    ln -s /home/tools/bedSort /usr/bin/ && \
    ln -s /home/tools/bedToBigBed /usr/bin/

# Install Skewer
WORKDIR /home/src/
RUN git clone git://github.com/relipmoc/skewer.git && \
    cd /home/src/skewer && \
    make && \
    make install
    
# OPTIONAL REQUIREMENTS
# Install F-seq
WORKDIR /home/src/
RUN wget https://github.com/aboyle/F-seq/archive/master.zip && \
    unzip master.zip && \
    cd /home/src/F-seq-master && \
    ant && \
    cd dist~/ && \
    tar xf fseq.tgz && \
    ln -s /home/src/F-seq-master/dist~/fseq/bin/fseq /usr/bin/

# Install Trimmomatic
WORKDIR /home/src/
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip && \
    unzip Trimmomatic-0.36.zip && \
    chmod +x Trimmomatic-0.36/trimmomatic-0.36.jar

# Set environment variables
ENV PATH=/home/tools/bin:/home/tools/:/home/tools/bin/kentUtils/:/home/src/F-seq-master/dist~/fseq/bin:/home/src/bowtie2-2.3.4.1:/home/src/skewer:/home/src/samtools-1.7:/home/src/Trimmomatic-0.36/:/home/src/htslib-1.7:$PATH \
    TRIMMOMATIC=/home/src/Trimmomatic-0.36/trimmomatic-0.36.jar \
    PICARD=/home/tools/bin/picard.jar \
    R_LIBS_USER=/usr/local/lib/R/site-library/

# Define default command
WORKDIR /home/
CMD ["/bin/bash"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*