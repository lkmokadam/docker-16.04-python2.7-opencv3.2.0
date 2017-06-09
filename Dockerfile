FROM lkmokadam/docker-python2.7

MAINTAINER Laxmikant Mokadam "lkmokadam@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update &&\
	apt-get install -y build-essential \
	cmake \
	qt5-default \
	libvtk6-dev \
	zlib1g-dev \
	libjpeg-dev \
	libwebp-dev \
	libpng-dev \
	libtiff5-dev \
	libjasper-dev \
	libopenexr-dev \
	libgdal-dev \
	libdc1394-22-dev \
	libavcodec-dev \
	libavformat-dev \
	libswscale-dev \
	libtheora-dev  \
	libvorbis-dev \
	libxvidcore-dev \
	libx264-dev  \
	yasm  \
	libopencore-amrnb-dev  \
	libopencore-amrwb-dev  \
	libv4l-dev  \
	libxine2-dev \
	libtbb-dev  \
	libeigen3-dev \
	python-dev  \
	python-tk  \
	python-numpy  \
	python3-dev  \
	python3-tk  \
	python3-numpy  \
	unzip  \
	wget &&\
	rm -rf /var/lib/apt/lists/*
	
RUN cd /tmp && \
	wget https://github.com/opencv/opencv/archive/3.2.0.zip && \
	unzip 3.2.0.zip && \
	rm 3.2.0.zip && \
	mv opencv-3.2.0 OpenCV && \
	cd OpenCV && \
	mkdir build && \
	cd build && \
	cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON .. && \
	make -j4  && \
	make install && \
	ldconfig

RUN rm -rf /tmp