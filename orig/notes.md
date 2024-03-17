# Notes.md

## Some docs

env variable you want


## Scratch

This is probably the command you want to run
1. `-v` for verbose
2. `--ask-become-pass` for sudo if needed.
```
ansible-playbook -v --ask-become-pass yourPlaybook
```

passing env
```
ansible-playbook -v --ask-become-pass release.yml --extra-vars "version=1.23.45 other_variable=foo"
```

  path: "{{lookup('env', 'BASH_DOT_PATH')}}/{{bash_aliases_file}}"


https://stackoverflow.com/questions/30662069/how-can-i-pass-variable-to-ansible-playbook-in-the-command-line

https://stackoverflow.com/questions/53596477/ansible-install-node-with-nvm

You can do this to put env names in vars
then you don't have to deal with this in the main tasks file.
Probably allow error chekcing tooo.
```
git_name: "{{lookup('env', 'GIT_NAME')}}"
```

lookup vs. ansible_env
1. When to use what...

https://docs.ansible.com/ansible/latest/modules/file_module.html
Has a sym link example

Saving tmp work...

```
- name: Create a symlink for bash alias
  file:
    src: bash_alias_path
    dest: ansible_env.HOME/.bash_alias
    owner: ansible_env.USER
    group: ansible_env.USER
    state: link
  when: bash_alias_path.stat.exists
```

```
- block:
  # There seems to be an issue of string
  # /tmp works but the trying to read from an ENV does
  - name: Store bash alias path 
    stat:
      path: "{{lookup('env', 'BASH_DOT_PATH')}}/dotfiles/.bash_alias"
    register: bash_alias_path 

  - name: Store tmux path 
    stat:
      path: "{{lookup('env', 'BASH_DOT_PATH')}}/dotfiles/.tmux"
    register: tmux_path 

  - name: Debuging the env.
    debug:
      msg: ">>> {{bash_alias_path}}"

  - name: Error. Path is not valid
    fail:
      msg: "Path does not exist"
    when:
      - not bash_alias_path.stat.exists

  
  
  any_errors_fatal: yes
```


Some tmp stuff
```
- name: Store path from env variable
    stat:
      path: lookup('env', 'BASH_ALIAS_PATH')
    register: bash_alias_path 

  - name: Fail test
    fail_when:
    - bash_alias_path.stat.exists
    - bash_alias_path.stat.isdir

  - name: Testing when
    debug:
      msg: When fired because its not empty
    when: lookup('env', 'BASH_ALIAS_PATH') != ""
  

```

```
- block:
  - name: Store path from env variable
    stat:
      path: lookup('env', 'BASH_ALIAS_PATH')
    register: bash_alias_path 

  - name: Debuging the env
    debug:
      msg: "{{lookup('env', 'BASH_ALIAS_PATH')}}"

  - name: Path is not valid
    fail:
      msg: "Path does not exist"
    when:
      - not bash_alias_path.stat.exists
  
  any_errors_fatal: yes
```

Extracting a path from and env varaible
1. Need to string and escape things
2. It seem like just a straight lookup didn't work
```
- name: Store path from env variable
    stat:
      path: "{{lookup('env', 'FOO')}}"
    register: bash_alias_path 
```

https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html
variable names are underscore

https://www.mydailytutorials.com/working-with-environment%E2%80%8B-variables-in-ansible/
ENV variables...

https://stackoverflow.com/questions/30662069/how-can-i-pass-variable-to-ansible-playbook-in-the-command-line
Passing env variables when running ansible-playbook.

```
ansible-playbook release.yml --extra-vars "version=1.23.45 other_variable=foo"
```


https://chaosmail.github.io/programming/2015/03/04/install-deb-packages-in-ansible/
Check if a deb package is installed before doing it.

https://stackoverflow.com/questions/29075287/ansible-insert-line-if-not-exists
This is to test if something does not exist and then write if it does not.

https://stackoverflow.com/questions/34340562/evaluating-return-code-in-ansible-conditional
Issue of grep return an non zero error code.
use failed_when to work around it.
You can use this in conjunction with text searches to do idepotent inserts.
see vscode for an example of this.


http://docs.ansible.com/ansible/latest/modules/blockinfile_module.html
Ansible text on how to insert text into block

https://stackoverflow.com/questions/24334115/ansible-lineinfile-for-several-lines/28306576#28306576
Adding lines to end of the file.

https://www.reddit.com/r/ansible/comments/bzdd7q/apt_install_linuxheadersuname_r_in_ansible/
For Linux headers

Use `package` instead of `apt` to keep things more generiic.

https://docs.ansible.com/ansible/latest/plugins/lookup/env.html
You probably want this.

https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html
I think this is what you want to aim for.

https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html


https://docs.ansible.com/ansible/latest/modules/apt_repository_module.html
For adding repos...

probably want to install keepass.

playbooks should be 127.0.0.1 for now.

you probably want this when you run playbook.
Chances are you want psuedo.

```
ansible-playbook sample.yaml --ask-become-pass
```

To escalate the user.
```
become: yes
```

List seems to be deprecated

https://www.mydailytutorials.com/introduction-ansible-apt-package-repository/



About yaml arrays...
https://stackoverflow.com/questions/23657086/yaml-multi-line-arrays

yaml indentions
need to study that...
but the level need to align. i wonder if ther is a linter