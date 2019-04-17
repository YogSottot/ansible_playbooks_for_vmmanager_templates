#### playbooks for vmmanager templates

- UMI-CMS template

http://help.docs.umi-cms.ru/vvedenie/ustanovka_i_nastrojka/sistemnie_trebovaniya/

Добавить tmpfiles для php sessions
https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

>cat /etc/tmpfiles.d/domain.tld.conf 
d /tmp/php_sessions/domain.tld 0770 user user -
d /tmp/php_upload/ext_www/domain.tld 0770 user user -
