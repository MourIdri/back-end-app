FROM ubuntu:16.04

# Update OS
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

LABEL version="1.0"
LABEL description="Flask with Python"

#DEBUG postion 
RUN ls -l 
RUN pwd

# Create app directory
RUN apt-get install -y git 
RUN git clone https://github.com/MourIdri/back-end-app.git /webapp

RUN ls -l -h /webapp && chmod -R 777 /webapp/* 
RUN pwd
RUN ls -l -h /webapp/



#DEBUG postion 
RUN ls -l /webapp
RUN pwd

RUN apt-get install -y ifstat \
inetutils-traceroute traceroute \
telnet curl python python-pip python3 \
python3-pip libapache2-mod-python libapache2-mod-php php-mysql mysql-client 

#INSTALL PHP DEPENSCIES
#RUN apt-get install -y \
#php php-fpm php-mysql \
#php-curl php-gd php-pear php-imagick php-imap php-mcrypt php-recode php-tidy php-xmlrpc php-curl php-gd php-intl php-json php-mbstring \
#php-mcrypt php-xml \
#php-zip


RUN a2enmod cgi
RUN pip install requests flask ConfigParser mysql-connector-python flask-restful ast 
RUN pip3 install requests 

RUN apt-get remove apache2 -y 

# Set the default directory for our environment
ENV HOME /webapp
WORKDIR /webapp

EXPOSE 8080
EXPOSE 8000
EXPOSE 80


CMD ["python", "app.py"]
