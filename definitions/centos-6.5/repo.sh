#!/usr/bin/env bash

cat > /etc/yum.repos.d/epel.repo << EOF
[epel]
name=epel
baseurl=http://download.fedoraproject.org/pub/epel/6/x86_64
enabled=1
gpgcheck=0
EOF

cat > /etc/yum.repos.d/puppet.repo << EOF
[puppetlabs-dependencies]
name=puppetlabs-dependencies
baseurl=http://yum.puppetlabs.com/el/6/dependencies/x86_64
enabled=1
gpgcheck=0

[puppetlabs-products]
name=puppetlabs-products
baseurl=http://yum.puppetlabs.com/el/6/products/x86_64
enabled=1
gpgcheck=0
EOF
