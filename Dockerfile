# Install conan packages under GCC 6.1

FROM ubuntu

MAINTAINER Uilian Ries <uilianries@gmail.com>

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties python-pip cmake

RUN add-apt-repository ppa:ubuntu-toolchain-r/test --yes

RUN apt-get update
RUN apt-get install -y gcc-6 g++-6
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6

RUN pip install --upgrade pip
RUN pip install conan

RUN conan install Poco/1.7.3@lasote/stable -s compiler=gcc -s compiler.version=6.1 -s compiler.libcxx=libstdc++11 --build=missing
RUN conan install Boost/1.60.0@lasote/stable -s compiler=gcc -s compiler.version=6.1 -s compiler.libcxx=libstdc++11 --build=missing
RUN conan install gtest/1.7.0@lasote/stable -s compiler=gcc -s compiler.version=6.1 -s compiler.libcxx=libstdc++11 --build=missing
