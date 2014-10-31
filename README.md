[![Galaxy](http://img.shields.io/badge/galaxy-zhurbilo.base--ubuntu-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/2046)

base-ubuntu (Ansible role)
=========

Ansible role to setup base foundation of Ubuntu instance.
Role was tested with Ansible version 1.7

Requirements
------------

- [Ansible](http://docs.ansible.com/intro_installation.html)
- [Vagrant](http://www.vagrantup.com/downloads.html)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Usage
------------
To set up you new environment run:

    ./build.sh vagrant

If everything is Ok, you will see the output:

    Idempotence test after reboot: Success
    
    ==================
    SUCCESS
    ==================
    
Execute `vagrant ssh` for connecting to provisioned machine.
 
`build.sh` also run some additional time-consuming steps like:
  
* run the role/playbook again, checking to make sure it's idempotent (no changes).
* reboot virtual machine
* restart provisioning after machine reboot to make sure it's idempotent as well

Of course you can run ansible and vagrant commands separately, that is more flexible than run build.sh script.

    vagrant up
    ansible-playbook -i vagrant-inventory playbook.yml

Note: I don't use `vagrant ansible provisioner`, which do provisioning with one command `vagrant up`, but it complicates the usage of ansible.
In my opinion the provisiong way of you local virtual machine or EC2 Amazon instance should be the same.


Dependencies
------------

None


Example Playbook
------------
       
    - hosts: machine
      sudo: true
      roles:
        - base-ubuntu
        


Role Variables
------------

None


License
-------

BSD

Author Information
------------------

Role was created by [Artsiom Zhurbila](http://www.linkedin.com/in/zhurbila)