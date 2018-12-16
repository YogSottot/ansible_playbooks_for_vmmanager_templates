#!/bin/sh
#
# metadata_begin
# recipe: UMI-CMS Centos
# tags: centos7, centos6
# revision: 1
# description_ru: UMI-CMS Centos
# description_en: UMI-CMS Centos
# metadata_end
#
dd if=/dev/zero of=/swapfile1 bs=2048 count=524288
mkswap /swapfile1
swapon /swapfile1
echo "/swapfile1 none swap sw 0 0" >> /etc/fstab
yum install epel-release -y
yum install ansible git -y
cd /root
git clone https://github.com/YogSottot/ansible_playbooks_for_vmmanager_templates/
cd ansible_playbooks_for_vmmanager_templates
ansible-playbook playbook-umi.yml

systemctl enable serial-getty@ttyS0.service
systemctl start serial-getty@ttyS0.service
