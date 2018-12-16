#!/bin/sh
#
# metadata_begin
# recipe: UMI-CMS Debian
# tags: debian
# revision: 1
# description_ru: UMI-CMS Debian
# description_en: UMI-CMS Debian
# metadata_end
#
dd if=/dev/zero of=/swapfile1 bs=2048 count=524288
mkswap /swapfile1
swapon /swapfile1
echo "/swapfile1 none swap sw 0 0" >> /etc/fstab

echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list

apt-get install dirmngr

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt-get update
apt-get install ansible git

cd /root
git clone https://github.com/YogSottot/ansible_playbooks_for_vmmanager_templates/
cd ansible_playbooks_for_vmmanager_templates
ansible-playbook playbook-umi.yml

systemctl enable serial-getty@ttyS0.service
systemctl start serial-getty@ttyS0.service