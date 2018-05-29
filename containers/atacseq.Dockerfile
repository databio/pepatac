# Pull base image
FROM jpsmith5/pepatac:0.5.0

# Who maintains this image
LABEL maintainer Jason Smith "jasonsmith@virginia.edu"

# Version info
LABEL version 0.3.0

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Copy over private key, and set permissions
#COPY id_rsa /root/.ssh/id_rsa

# Create known_hosts
#RUN touch /root/.ssh/known_hosts
# Add github key
#RUN ssh-keyscan -T 60 github.org >> /root/.ssh/known_hosts

# Clone the conf files into the docker container
WORKDIR /home/tools/
RUN git clone https://github.com/databio/ATACseq.git


# Update path
ENV PATH=/home/tools/ATACseq:/home/tools/ATACseq/pipelines:$PATH
