Ansible role pam-limits
==========
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Variables](#variables)
- [Usage](#usage)

# Introduction
Configure pam limits using Ansible on RHEL based systems.
By default, if __pam_limits_config__ is not an empty list, all configuration
items will be saved in __pam_limits_config_file_path__/__pam_limits_config_file_name__ which is /etc/security/limits.d/99-ansible.conf. One can define separate files for items.
See examples bellow on how to do that. If the configration file does not exist
it will be created.

# Requirements
Ansible => 2.0

# Variables
| Name | Description | Default |
|:-----|:------------|:--------|
| pam_limits_config_file_path | Path where configure files will be stored | /etc/security/limits.d |
| pam_limits_config_file_name | | 99-ansible.conf |
| pam_limits_config | List of dictionaries describing the items to ensure | [] |

# Usage
Ensure file /etc/security/limits.d/10-gcr.conf and and /etc/security/limits.d/99-audio.conf
exist and have the right configuration.
```yaml
- hosts: oracle-server
  become: true
  become_method: sudo
  become_user: root
  vars:
    pam_limits_config:
    - filename: 10-gcr.conf
      parameters:
      - domain: '@users'
        type: '-'
        item: memlock
        value: 1024
    - filename: 99-audio.conf
      parameters:
      - domain: '@audio'
        type: '-'
        item: rtprio
        value: 99
  roles:
  - role: pam-limits
```
