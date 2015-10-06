FROM insidin/alpine-hadoop

ENV PATH /python/bin:$PATH 

RUN apk add --update python python-dev py-pip build-base && \ 
	pip install --upgrade pip && \
	pip install virtualenv && \ 
	rm -rf /var/cache/apk/* && \
	virtualenv --clear python 



