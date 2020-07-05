#!/bin/sh
#
# metadata_begin
# recipe: UMI-CMS Centos
# tags: centos7, centos8
# revision: 1
# description_ru: UMI-CMS (php-fpm) Centos
# description_en: UMI-CMS (php-fpm) Centos
# metadata_end
#
yum install epel-release -y
yum install ansible git -y
cd /root
git clone https://github.com/YogSottot/ansible_playbooks_for_vmmanager_templates/
cd ansible_playbooks_for_vmmanager_templates
ansible-playbook --connection=local --inventory 127.0.0.1, --limit 127.0.0.1 playbook-umi-fpm.yml

#systemctl enable serial-getty@ttyS0.service
#systemctl start serial-getty@ttyS0.service
