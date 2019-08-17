# Ansible Starter

Still under development, needs improvements.

### Creating The Command:

Just execute 'bash ansible-starter.sh install', the ansible-starter will be deployed at your /usr/local/bin/ and you'll be able to call it anywhere.

### For usage:

- ./ansible-starter.sh => creates a basic directory structure:

provision/playbook.yml

- ./ansible-starter.sh -r how/many/tasks/you/want =>
creates a basic directory structure including roles with tasks and vars folders:

provision/
- playbook.yml
- roles/
    - how
        - tasks
        - vars
    - many
        - tasks
        - vars
    - tasks
        - tasks
        - vars
    - you
        - tasks
        - vars
    - want
        - tasks
        - vars
