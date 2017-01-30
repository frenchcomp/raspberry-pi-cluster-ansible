FROM resin/rpi-raspbian:jessie

MAINTAINER Richard Déloge <richarddeloge@gmail.com>

RUN echo "deb http://repozytorium.mati75.eu/raspbian jessie-backports main contrib non-free" >> /etc/apt/sources.list.d/php.list
RUN gpg --keyserver pgpkeys.mit.edu --recv-key CCD91D6111A06851
RUN gpg --armor --export CCD91D6111A06851 | apt-key add -

RUN apt-get update 
RUN apt-get install -y nano wget git sudo
RUN apt-get install -y php7.0-common php7.0-cli php7.0-fpm php7.0-mcrypt php7.0-mysql php7.0-apcu php7.0-gd php7.0-curl php7.0-intl php7.0-json php7.0-pgsql php7.0-phpdbg php7.0-sqlite3 php7.0-xml php7.0-mbstring php7.0-bcmath
RUN apt-get install curl

RUN mkdir -p /run/php/

ADD docker.ini /etc/php/7.0/mods-available/

RUN ln -s /etc/php/7.0/mods-available/docker.ini /etc/php/7.0/cli/conf.d/99-docker.ini
RUN ln -s /etc/php/7.0/mods-available/docker.ini /etc/php/7.0/fpm/conf.d/99-docker.ini
