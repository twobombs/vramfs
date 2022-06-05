FROM twobombs/cudacluster

RUN git clone https://github.com/Overv/vramfs.git && apt install -y libfuse3-dev && clean all && make && ln /usr/bin/fusermount /usr/bin/fusermount3
RUN mkdir vramfs

COPY run-vramfs /root/run-vramfs
RUN chmod 755 /root/run-vramfs

EXPOSE 5900 6080
ENTRYPOINT /root/run-vramfs
