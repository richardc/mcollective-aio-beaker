#!/bin/sh
set -x
set -e

# pl nightlies repo:

cd /etc/yum.repos.d
curl -O http://nightlies.puppetlabs.com/puppet-agent-latest/repo_configs/rpm/pl-puppet-agent-latest-el-7-x86_64.repo

# products/deps repo
rpm -i http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

# set up activemq
yum install -y activemq
cp /vagrant/files/activemq.xml /etc/activemq/activemq.xml
cp /vagrant/files/activemq.truststore /etc/activemq/activemq.truststore
cp /vagrant/files/activemq.keystore /etc/activemq/activemq.keystore

service activemq start

# set up mcollective via puppet-agent
yum install -y puppet-agent

cp /vagrant/files/server.cfg /etc/puppetlabs/mcollective/server.cfg
cp /vagrant/files/client.cfg /etc/puppetlabs/mcollective/client.cfg
cp /vagrant/files/ca_crt.pem /etc/puppetlabs/mcollective/ca_crt.pem
cp /vagrant/files/server.crt /etc/puppetlabs/mcollective/server.crt
cp /vagrant/files/server.key /etc/puppetlabs/mcollective/server.key
cp /vagrant/files/client.crt /etc/puppetlabs/mcollective/client.crt
cp /vagrant/files/client.key /etc/puppetlabs/mcollective/client.key

mkdir /etc/puppetlabs/mcollective/ssl-clients
cp /vagrant/files/client.crt /etc/puppetlabs/mcollective/ssl-clients/client.pem

service mcollective start
