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
        

Test role with Vagrant
----------------

Move to repo directory and run `./build.sh vagrant`

If everything is Ok, you will see the part of output:

    >>> Step 2: run the role/playbook with ansible-playbook

    PLAY [machine] **************************************************************** 
    
    GATHERING FACTS *************************************************************** 
    ok: [machine]
    
    TASK: [base-ubuntu | set locale en_US.UTF-8] ********************************** 
    ok: [machine]
    
    TASK: [base-ubuntu | update apt-get] ****************************************** 
    ok: [machine]
    
    TASK: [base-ubuntu | install basic packages] ********************************** 
    changed: [machine] => (item=ntp,git,htop,vim,curl,tmux,openssl,libssl-dev,libssl-doc,bash)
    
    TASK: [base-ubuntu | run shellshock example command] ************************** 
    ok: [machine]
    
    TASK: [base-ubuntu | python | install python packages] ************************ 
    changed: [machine] => (item=python,python-dev,python-software-properties,python-pip,build-essential,libmysqlclient-dev,libxml2,libxml2-dev,libxslt1-dev,libmemcached-dev,libffi-dev)
    
    TASK: [base-ubuntu | python | update pip] ************************************* 
    changed: [machine] => (item=pip)
    changed: [machine] => (item=setuptools)
    
    PLAY RECAP ******************************************************************** 
    machine                    : ok=7    changed=3    unreachable=0    failed=0   
    
    >>> Step 3: run the role/playbook again, checking to make sure it's idempotent.
    Idempotence test: Success
    
    ==================
    SUCCESS
    ==================


Execute `vagrant ssh` for connecting to provisioned machine.