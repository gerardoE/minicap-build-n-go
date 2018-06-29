# Using Ubuntu Latest as base OS
FROM ubuntu:latest
MAINTAINER Gerardo Espinoza

# Update Repositories quietly
RUN apt-get -y update

ADD requirements.txt /
# Install any needed packages specified in requirements.txt
RUN apt-get -y install $(cat requirements.txt) && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

# Extract minicap and ndk-build.
ADD minicap-build-n-go.tar.gz /

# Install npm needed modules for example/app.js 
RUN cd minicap/example/ \
    && npm install 



# Add ndk-build binary to PATH
ENV PATH="/opt/android-ndk-r14b:${PATH}"

#ADD android-ndk-r14b.tar.gz /opt/
RUN wget -O android-ndk-r14b-linux-x86_64.zip https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip \
    && unzip android-ndk-r14b-linux-x86_64.zip -d /opt/ \
    && rm android-ndk-r14b-linux-x86_64.zip 

RUN cd minicap \
    && make

# Expose port 9002 for host access
EXPOSE 9002

