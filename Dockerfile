# Import Ubuntu
FROM ubuntu:latest

# Create Network
EXPOSE 3080

# Prepare System 
RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN apt-get install locales

# Set locales
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Install gns3-server with IOU support
RUN add-apt-repository ppa:gns3/ppa
RUN apt-get install gns3-server -y 
RUN apt-get install gns3-iou -y

RUN touch /var/log/gns3server

CMD ["gns3server", "--log", "/var/log/gns3server"]
