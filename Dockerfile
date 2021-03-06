FROM ubuntu:18.04

MAINTAINER John Marlo Evangelista <ejohnmarlo@gmail.com>

RUN apt-get -y update \
&& apt-get install -y systemd nano isc-dhcp-server \
&& apt-get -y autoremove \
&& apt-get -y clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR root

COPY util util

RUN chmod +x util/entrypoint.sh \
&& util/entrypoint.sh

CMD ["/lib/systemd/systemd"]
