WORK_DIR=`pwd`

image: rootfs
	docker build -t deepin-buster:10 .
rootfs:
	rm -rvf /tmp/rootfs/
	debootstrap --no-check-gpg --arch=amd64 buster /tmp/rootfs https://mirrors.ustc.edu.cn/debian/ 
	rm -f /tmp/rootfs/var/cache/apt/archives/*.deb
	cd /tmp/rootfs/ && tar -cvzpf /tmp/rootfs.tar.gz *
	mv /tmp/rootfs.tar.gz ${WORK_DIR}
clean:
	rm rootfs.tar.gz
