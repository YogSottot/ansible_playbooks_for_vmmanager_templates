#!/bin/sh
#
# metadata_begin
# recipe: UMI-CMS Ubuntu
# tags: ubuntu
# revision: 1
# description_ru: UMI-CMS Ubuntu
# description_en: UMI-CMS Ubuntu
# metadata_end
#
dd if=/dev/zero of=/swapfile1 bs=2048 count=524288
mkswap /swapfile1
swapon /swapfile1
echo "/swapfile1 none swap sw 0 0" >> /etc/fstab

apt-get install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install ansible git python -y

cd /root
git clone https://github.com/YogSottot/ansible_playbooks_for_vmmanager_templates/
cd ansible_playbooks_for_vmmanager_templates
ansible-playbook playbook-umi.yml

systemctl enable serial-getty@ttyS0.service
systemctl start serial-getty@ttyS0.service