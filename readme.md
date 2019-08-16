# Ansible Starter

Still under development, needs improvements.

### Creating The Command:

Just execute the 'create-command.sh' script, and it will copy and chmod ansible-starter into your /usr/local/bin/ directory so you can execute the command anywhere on your machine.

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
