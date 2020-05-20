FROM debian:10

RUN set -xe \
	&& DEBIAN_FRONTEND=noninteractive apt-get update

RUN set -xe \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
	gawk git build-essential automake autoconf git squashfs-tools ssh-askpass pkg-config curl wget \
	xsltproc fop libxml2-utils cpio rsync \
	libssl-dev libncurses5-dev bc m4 unzip cmake python3 python2 \
	libwxgtk3.0-dev

RUN set -xe \
	&& echo "dash dash/sh boolean false" | debconf-set-selections \
        && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN wget https://github.com/fhunleth/fwup/releases/download/v1.7.0/fwup_1.7.0_amd64.deb \
        && dpkg -i fwup_1.7.0_amd64.deb

# delete all the apt list files since they're big and get stale quickly
RUN rm -rf /var/lib/apt/lists/*
# this forces "apt-get update" in dependent images, which is also good
# (see also https://bugs.launchpad.net/cloud-images/+bug/1699913)

COPY install.sh /tmp
RUN chmod +x /tmp/install.sh
RUN sh /tmp/install.sh
