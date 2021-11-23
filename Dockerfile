FROM centos:centos7

ENV PACKER_VER=1.7.8

ADD ca-trust /etc/pki/ca-trust/source/anchors/
ADD VERSION .

# Install jq
RUN     yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
        yum install jq -y

RUN     wget -q https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_linux_amd64.zip && \
        unzip packer_${PACKER_VER}_linux_amd64.zip && \
        mv -f packer /usr/local/bin/

RUN     yum -yq install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
        yum update -y && yum -y install curl wget unzip git ca-certificates openssl jq && \
        update-ca-trust force-enable && \
        update-ca-trust extract
