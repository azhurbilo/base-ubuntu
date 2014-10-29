#!/bin/sh


if [ "$1" = "vagrant" ]
  then
    set -e

    echo "Vagrant..."
    INVENTORY_FILE=vagrant-inventory

    vagrant destroy -f
    vagrant up

elif [ "$1" = "local" ]
  then
    echo "Local..."
    INVENTORY_FILE=local-inventory

else
  echo "First argument is not defined properly. Choose [ vagrant | local ] ..."
  exit
fi

# Step 1:
echo ">>> Step 1: check role/playbook syntax"
ansible-playbook -i tests/${INVENTORY_FILE} tests/test.yml --syntax-check

# Step 2:
echo ">>> Step 2: run the role/playbook with ansible-playbook"
ansible-playbook -i tests/${INVENTORY_FILE} tests/test.yml

# Step 3:
echo ">>> Step 3: run the role/playbook again, checking to make sure it's idempotent."
ansible-playbook -i tests/${INVENTORY_FILE} tests/test.yml  | grep -q 'changed=0.*failed=0'\
&& (echo 'Idempotence test: Success' && exit 0) || (echo 'Idempotence test: Fail' && exit 1)

echo "=================="
echo "SUCCESS"
echo "=================="