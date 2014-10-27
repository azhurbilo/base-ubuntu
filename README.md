[![Galaxy](http://img.shields.io/badge/galaxy-zhurbilo.base--ubuntu-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/2046)

base-ubuntu (Ansible role)
=========

Ansible role to setup base foundation of Ubuntu instance.


Role Variables
--------------


Name | Default Value | Description  
--- | --- | ---
base_ubuntu_language | no | execution of additional tasks depends on this var to setup specifi language-base environment. Currently available: python


Example Playbook
----------------
       
    - hosts: machine
      sudo: true
      vars:
        base_ubuntu_language: python
      roles:
        - base-ubuntu