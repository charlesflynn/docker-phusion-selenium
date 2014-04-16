FROM phusion/passenger-nodejs:0.9.9
# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# java
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" > /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install -y oracle-java7-installer

# xvfb
RUN apt-get install -y xvfb
RUN echo -n :99 > /etc/container_environment/DISPLAY
RUN mkdir /etc/service/xvfb
ADD xvfb.sh /etc/service/xvfb/run
RUN chmod +x /etc/service/xvfb/run

# selenium
RUN npm install -g selenium-standalone
RUN mkdir /etc/service/selenium
ADD selenium.sh /etc/service/selenium/run
RUN chmod +x /etc/service/selenium/run
EXPOSE 4444

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
