yum update

export BISON_VERSION="3.0.5"

# install common environment
yum --enablerepo=extras install -y centos-release-scl epel-release \
&& yum install -y git cmake3 wget

# install environment for CUBRID
yum install -y devtoolset-8-gcc devtoolset-8-gcc-c++ devtoolset-8-make \
		devtoolset-8-elfutils-libelf-devel devtoolset-8-systemtap-sdt-devel \
		ncurses-devel java-1.8.0-openjdk-devel ant flex sclo-git212 libxslt \
		rpm-build libtool libtool-ltdl autoconf automake

export BISON_VERSION="3.0.5"
curl -L https://ftp.gnu.org/gnu/bison/bison-${BISON_VERSION}.tar.gz | tar xzvf - \
    && cd bison-${BISON_VERSION} && ./configure --prefix=/usr && make all install \
    && rm -rf bison-${BISON_VERSION}

cd /home/vagrant
mkdir -p bin
ln -sf /usr/bin/cmake3 /home/vagrant/bin/cmake
chown -R vagrant /home/vagrant/bin

echo 'export PATH=/home/vagrant/bin:$PATH' >> /home/vagrant/.bashrc
echo 'export JAVA_PATH=/usr/lib/jvm/java' >> /home/vagrant/.bashrc
echo 'source scl_source enable devtoolset-8' >> /home/vagrant/.bash_profile