# `vramfs` with highly experimental swap on NFS-roids
OpenCL vRAMfs swap with NFS mount for Great Justice!

execute this madness with :
````bash
docker run --gpus all --device=/dev/dri:/dev/dri -d --privileged twobombs/vramfs -v /swapvramfs:/swapvramfs
````

vramfs code included from https://github.com/Overv/vramfs
