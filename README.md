[![Galaxy](http://img.shields.io/badge/galaxy-zhurbilo.base--ubuntu-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/2046)

base-ubuntu (Ansible role)
=========

Ansible role to setup base foundation of Ubuntu instance.
Role was tested with Ansible version 1.7


Role Variables
--------------


Name | Default Value | Available Values | Description  
--- | --- | --- | ---
base_ubuntu_language | no | <ul><li>python</li></ul> | execution of additional tasks depends on this var to setup specific language-base environment.


Example Playbook
----------------
       
    - hosts: machine
      sudo: true
      vars:
        base_ubuntu_language: python
      roles:
        - base-ubuntu