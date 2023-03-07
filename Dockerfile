FROM twobombs/cudacluster

RUN apt install -y flex libncurses-dev bison libelf-dev libssl-dev linux-source  
RUN git clone https://evilpiepirate.org/git/bcachefs.git && cd bcachefs && mkdir debian && cp -v /usr/src/linux-source-*/debian/canonical-*.pem ./debian/ && make xconfig && make -i -k -j 2
RUN git clone https://evilpiepirate.org/git/bcachefs-tools.git && bcachefs-tools && make -i -k -j 2

RUN apt install -y libfuse3-dev nfs-common nfs-kernel-server opencl-headers && apt clean all && ln /usr/bin/fusermount /usr/bin/fusermount3
RUN git clone https://github.com/Overv/vramfs.git && cd vramfs && make 

RUN mkdir swapvramfs && mkdir swapnfs

COPY exports /etc/exports
RUN exportfs -a

COPY run-vramfs /root/run-vramfs
RUN chmod 755 /root/run-vramfs

EXPOSE 5900 6080
ENTRYPOINT /root/run-vramfs
