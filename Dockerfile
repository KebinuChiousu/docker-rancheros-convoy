FROM rancher/os-debianconsole:v0.7.0
#FROM rancher/os-console:v0.4.2
#FROM ubuntu:xenial
MAINTAINER Kevin M Meredith <https://github.com/KebinuChiousu>
#
# Obtain version 0.5.0 of convoy docker volume plugin
ADD https://github.com/rancher/convoy/releases/download/v0.5.0/convoy.tar.gz /usr/local

RUN tar -xvf /usr/local/convoy.tar.gz

ADD convoy-start.sh /convoy-start.sh

RUN cp /usr/local/convoy/convoy* /usr/bin \
    && rm -rf /usr/local/convoy.tar.gz \
    && chmod +x /convoy-start.sh
	
ENTRYPOINT ["/convoy-start.sh"]