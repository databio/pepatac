# Pull base image
FROM phusion/baseimage:master

# Who maintains this image
LABEL maintainer Jason Smith "jasonsmith@virginia.edu"

# Version info
LABEL version 0.10.1

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install dependencies
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes \
    libbz2-dev \
    build-essential \
    curl \
    default-jre \
    default-jdk \
    openjdk-8-jdk \
    git \
    libcommons-math3-java \
    libcurl4-gnutls-dev \ 
    libjbzip2-java \
    liblua5.1-0-dev \
    libpng-dev \
    libssl-dev \
    libtbb2 \
    libtbb-dev \
    lua-filesystem-dev \
    lua-lpeg-dev \
    lua-md5-dev \
    libexpat1-dev \
    libtre-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libsqlite3-dev \
    libbam-dev \
    libxml2-dev \
    openssl \
    perl \
    pigz=2.4-1 \
    software-properties-common \
    python3.8 \
    python3-pip \
    python3-dev \
    build-essential \
    rustc \
    wget \
    zlib1g \
    zlib1g-dev    

# Install MySQL server
RUN DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes mysql-server \
    mysql-client \
    libmysqlclient-dev

# Install python tools
RUN python3.8 -m pip install -U pip
RUN pip install numpy>=1.17  # must install separate from MACS due to setup_requires conflicts
RUN pip install virtualenv && \
    pip install cython>=0.29 && \
    pip install cykhash && \
    pip install pararead && \
    pip install attmap>=0.12.9 && \
    pip install codecov>=2.0 && \
    pip install colorama>=0.3.9 && \
    pip install cython>=0.29 && \
    pip install cykhash>=1.0.2 && \
    pip install jinja2>=2.11.2 && \
    pip install jsonschema>=3.0.1 && \
    pip install logmuse>=0.2.5 && \
    pip install oyaml>=0.9 && \
    pip install pandas>=0.20.2 && \
    pip install peppy>=0.31.0 && \
    pip install piper>=0.12.1 && \
    pip install psutil>=5.6.3 && \
    pip install pysam>=0.13 && \
    pip install python-Levenshtein>=0.12.0 && \
    pip install pyyaml>=3.13 && \
    pip install refgenconf>=0.7.0 && \
    pip install refgenie>=0.9.3 && \
    pip install ubiquerg>=0.6.1 && \
    pip install yacman>=0.6.7

# Install R
RUN apt update -qq && \
    DEBIAN_FRONTEND=noninteractive apt --assume-yes install --no-install-recommends dirmngr
RUN apt-key adv --keyserver  hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

RUN DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install r-base r-base-dev r-base-core r-recommended && \
    echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile

RUN Rscript -e "install.packages('argparser')" && \
    Rscript -e "install.packages('optigrab')" && \
    Rscript -e "install.packages('data.table')" && \
    Rscript -e "install.packages('xml2')" && \
    Rscript -e "install.packages('roxygen2')" && \
    Rscript -e "install.packages('rversions')" && \
    Rscript -e "install.packages('devtools')" && \
    Rscript -e "install.packages('ggrepel')" && \
    Rscript -e "install.packages('ggplot2')" && \  
    Rscript -e "install.packages('gplots')" && \
    Rscript -e "install.packages('grid')" && \    
    Rscript -e "install.packages('gtable')" && \
    Rscript -e "install.packages('scales')" && \
    Rscript -e "install.packages('stringr')" && \
    Rscript -e "devtools::install_github('pepkit/pepr')" && \    
    Rscript -e "install.packages('data.table')" && \
    Rscript -e "install.packages('BiocManager')" && \
    Rscript -e "BiocManager::install('GenomicRanges')" && \
    Rscript -e 'BiocManager::install("Biostrings")' && \
    Rscript -e 'BiocManager::install("AnnotationHub")' && \
    Rscript -e 'BiocManager::install("AnnotationFilter")' && \
    Rscript -e "BiocManager::install('BSgenome')" && \
    Rscript -e "BiocManager::install('GenomicFeatures')" && \
    Rscript -e "BiocManager::install('ensembldb')" && \
    Rscript -e "BiocManager::install('ExperimentHub')"
RUN Rscript -e "devtools::install_github('databio/GenomicDistributions')"
RUN wget http://big.databio.org/GenomicDistributionsData/GenomicDistributionsData_0.0.2.tar.gz
RUN Rscript -e "install.packages('GenomicDistributionsData_0.0.2.tar.gz', repos=NULL)"
RUN Rscript -e "devtools::install_github('databio/pepatac/PEPATACr/')"

# Install bedtools
RUN DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes \
    ant \
    bedtools>=2.29.2 

# Install fastqc
WORKDIR /home/tools/
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip && \
    unzip fastqc_v0.11.9.zip && \
    cd /home/tools/FastQC && \
    chmod 755 fastqc && \ 
    ln -s /home/tools/FastQC/fastqc /usr/bin/

# Install htslib
WORKDIR /home/src/
RUN wget https://github.com/samtools/htslib/releases/download/1.12/htslib-1.12.tar.bz2 && \
    tar xf htslib-1.12.tar.bz2 && \
    cd /home/src/htslib-1.12 && \
    ./configure --prefix /home/src/ && \
    make && \
    make install

# Install MACS2 from PyPi
WORKDIR /home/tools/
RUN pip install MACS2

# Install samtools
WORKDIR /home/src/
RUN wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2 && \
    tar xf samtools-1.12.tar.bz2 && \
    cd /home/src/samtools-1.12 && \
    ./configure && \
    make && \
    make install && \
    ln -s /home/src/samtools-1.12/samtools /usr/bin/

# Install preseq
WORKDIR /home/tools/
RUN wget https://github.com/smithlabcode/preseq/releases/download/v3.1.2/preseq-3.1.2.tar.gz && \
    tar xf preseq-3.1.2.tar.gz && \
    cd preseq-3.1.2 && \
    mkdir build && cd build && \
    ../configure --enable-hts \
        CPPFLAGS=-I"/home/src/include" \
        LDFLAGS="-L/home/src/lib -Wl,-R/home/src/lib" && \
    make && \
    make install

# Install bowtie2
WORKDIR /home/src/
RUN wget -O bowtie2-2.4.2-source.zip 'https://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.4.2/bowtie2-2.4.2-source.zip?ts=gAAAAABgfxZxKMUjBU0A0XjfO55q36KUoO9RRemjzTT_WCDpSSZCy8NtKrFODKV4xS_135KTiIdnBSaqmvHuQw9l6nqM2EULvw%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fbowtie-bio%2Ffiles%2Fbowtie2%2F2.4.2%2Fbowtie2-2.4.2-source.zip%2Fdownload' && \
    unzip bowtie2-2.4.2-source.zip && \
    cd /home/src/bowtie2-2.4.2 && \
    make && \
    make install && \
    ln -s /home/src/bowtie2-2.4.2/bowtie2 /usr/bin/

# Install samblaster
WORKDIR /home/tools/
RUN git clone https://github.com/GregoryFaust/samblaster.git && \
    cd /home/tools/samblaster && \
    make && \
    ln -s /home/tools/samblaster/samblaster /usr/bin/

# Install UCSC tools
WORKDIR /home/tools/
RUN wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig && \
    wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/wigToBigWig && \
    wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigCat && \
    wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bedSort && \
    wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed && \
    wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigMerge && \
    chmod +x /home/tools/bedGraphToBigWig && \
    chmod +x /home/tools/wigToBigWig && \
    chmod +x /home/tools/bigWigCat && \
    chmod +x /home/tools/bedSort && \
    chmod +x /home/tools/bedToBigBed && \
    chmod +x /home/tools/bigWigMerge && \
    ln -s /home/tools/bedGraphToBigWig /usr/bin/ && \
    ln -s /home/tools/wigToBigWig /usr/bin/ && \
    ln -s /home/tools/bigWigCat /usr/bin/ && \
    ln -s /home/tools/bedSort /usr/bin/ && \
    ln -s /home/tools/bigWigMerge /usr/bin/ && \
    ln -s /home/tools/bedToBigBed /usr/bin/

# Install Skewer
WORKDIR /home/src/
RUN git clone https://github.com/relipmoc/skewer.git && \
    cd /home/src/skewer && \
    make && \
    make install
    
# OPTIONAL REQUIREMENTS
# Install bwa
WORKDIR /home/src/
RUN wget -O bwa-0.7.17.tar.bz2  'https://downloads.sourceforge.net/project/bio-bwa/bwa-0.7.17.tar.bz2?ts=gAAAAABgfZHQ5GyuWr5rjuP8wYOC1ueJsyJD3qN-MfiwKeN3jxzRMWGU1eUfKvYzteg86k_UeLBYZTRRm1deDQaokXbPaevHYw%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fbio-bwa%2Ffiles%2Flatest%2Fdownload' && \
    tar xf bwa-0.7.17.tar.bz2 && \
    cd /home/src/bwa-0.7.17 && \
    make && \
    ln -s /home/src/bwa-0.7.17/bwa /usr/bin/

# Install F-seq2
WORKDIR /home/src/
RUN pip install pyBigWig
RUN wget https://github.com/Boyle-Lab/F-Seq2/archive/master.zip && \
    unzip master.zip && \
    cd /home/src/F-Seq2-master && \
    python3 setup.py install

# Install genometools
WORKDIR /home/tools/
RUN wget http://genometools.org/pub/genometools-1.6.1.tar.gz && \
    tar xf genometools-1.6.1.tar.gz && \
    cd /home/tools/genometools-1.6.1 && \
    make useshared=yes && \
    make install

# Install Genrich
WORKDIR /home/tools/
RUN git clone https://github.com/jsh58/Genrich.git && \
    cd Genrich && \
    make && \
    ln -s /home/tools/Genrich/Genrich /usr/bin/

# Install HMMRATAC
WORKDIR /home/tools/bin
RUN wget https://github.com/LiuLabUB/HMMRATAC/releases/download/1.2.10/HMMRATAC_V1.2.10_exe.jar && \
    chmod +x HMMRATAC_V1.2.10_exe.jar

# Install HOMER
WORKDIR /home/tools/bin
RUN wget http://homer.ucsd.edu/homer/configureHomer.pl && \
    perl /home/tools/bin/configureHomer.pl -install && \
    perl /home/tools/bin/configureHomer.pl -install human && \
    perl /home/tools/bin/configureHomer.pl -install mouse

# Install MACS3 from github
WORKDIR /home/tools/
RUN git clone https://github.com/macs3-project/MACS.git --recurse-submodules && \
    cd /home/tools/MACS && \
    python3 setup.py install

# Install picard
WORKDIR /home/tools/bin
RUN wget https://github.com/broadinstitute/picard/releases/download/2.25.2/picard.jar && \
    chmod +x picard.jar

# Install seqOutBias
WORKDIR /home/tools/
RUN wget -O seqOutBias-v1.3.0.tar.gz 'https://github.com/guertinlab/seqOutBias/archive/refs/tags/v1.3.0.tar.gz' && \
    tar xf seqOutBias-v1.3.0.tar.gz && \
    cd seqOutBias-1.3.0 && \
    cargo build --release && \
    ln -s /home/tools/seqOutBias-1.3.0/target/release/seqOutBias /usr/bin/

# Install Trimmomatic
WORKDIR /home/src/
RUN wget https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip && \
    unzip Trimmomatic-0.39.zip && \
    chmod +x Trimmomatic-0.39/trimmomatic-0.39.jar

# Install F-seq
WORKDIR /home/src/
RUN git clone https://github.com/aboyle/F-seq.git
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ \
    PATH=$PATH:$JAVA_HOME/bin
RUN cd /home/src/F-seq && \
    ant && \
    cd dist~/ && \
    tar xf fseq.tgz && \
    ln -s /home/src/F-seq/dist~/fseq/bin/fseq /usr/bin/

# Set environment variables
ENV PATH=/home/tools/bin:/home/tools/:/home/tools/bin/kentUtils/:/home/src/bowtie2-2.4.2:/home/src/skewer:/home/src/samtools-1.12:/home/src/Trimmomatic-0.39/:/home/src/htslib-1.12:$PATH \
    TRIMMOMATIC=/home/src/Trimmomatic-0.39/trimmomatic-0.39.jar \
    PICARD=/home/tools/bin/picard.jar \
    HMMRATAC=/home/tools/bin/HMMRATAC_V1.2.10_exe.jar \
    R_LIBS_USER=/usr/local/lib/R/site-library/ \
    PYTHONPATH=/usr/local/lib/python3.8/dist-packages:$PYTHONPATH

# Create python alias
RUN echo 'alias python="/usr/bin/python3"' >> /root/.bashrc && \
    /bin/bash -c "source /root/.bashrc"

# Make python3 default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

# Define default command
WORKDIR /home/
CMD ["/bin/bash"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
