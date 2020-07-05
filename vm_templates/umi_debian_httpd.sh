#!/bin/sh
#
# metadata_begin
# recipe: UMI-CMS Debian / Ubuntu
# tags: debian9, debian10, ubuntu18.04, ubuntu20.04
# revision: 1
# description_ru: UMI-CMS (httpd) Debian / Ubuntu
# description_en: UMI-CMS (httpd) Debian / Ubuntu
# metadata_end
#
apt update
apt install ansible git

cd /root
git clone https://github.com/YogSottot/ansible_playbooks_for_vmmanager_templates/
cd ansible_playbooks_for_vmmanager_templates
ansible-playbook --connection=local --inventory 127.0.0.1, --limit 127.0.0.1 playbook-umi-httpd.yml

#systemctl enable serial-getty@ttyS0.service
#systemctl start serial-getty@ttyS0.service
