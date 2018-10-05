# Import Ubuntu
FROM ubuntu:latest

# Create Network
EXPOSE 3080

# Noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Prepare System 
RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get install apt-utils -y
RUN apt-get install git -y
RUN apt-get install software-properties-common -y
RUN apt-get install locales -y
RUN apt-get install python -y
RUN echo '127.0.0.127 xml.cisco.com' >> /etc/hosts

# Set locales
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Install gns3-server with IOU support
RUN add-apt-repository ppa:gns3/ppa
RUN apt-get install gns3-server -y 
RUN apt-get install gns3-iou -y

# Create IOU Key
RUN git clone https://github.com/wnap/IOURC.git
RUN python IOURC/CiscoIOUKeygen.py | tail -n 6 | head -n 2 > ~/.iourc

RUN touch /var/log/gns3server

CMD ["echo" "~/.iourc"]
CMD ["gns3server", "--log", "/var/log/gns3server"]
