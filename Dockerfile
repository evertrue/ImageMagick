FROM ubuntu:16.04
MAINTAINER Evertrue Devops <devops@evertrue.com>

RUN echo 'deb-src http://archive.ubuntu.com/ubuntu/ xenial-updates main restricted' \
    > /etc/apt/sources.list.d/restricted.list

RUN apt-get -y update && \
    apt-get install -y apt-utils aptitude pbuilder ruby2.3 ruby2.3-dev libzip-dev build-essential \
    checkinstall dpkg-sig
RUN apt-get -y build-dep imagemagick
RUN gem install --no-ri --no-rdoc deb-s3

#COPY build /build
RUN mkdir /build

WORKDIR /build

COPY build-debian /build/build-debian

RUN mkdir /root/.gnupg
COPY gpg.conf /root/.gnupg/gpg.conf

RUN /usr/lib/pbuilder/pbuilder-satisfydepends --control /build/build-debian/control

# Because of the quirks of `checkinstall` the package needs to be built in
# the exact location that it will be when it is installed for real.
RUN mkdir -p /opt/ImageMagick-6

CMD ["/build/build-debian/run"]
#CMD ["/bin/bash"]
