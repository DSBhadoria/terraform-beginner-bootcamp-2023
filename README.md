# Terraform Beginner Bootcamp 2023

## Semantic Versioning

Given a version number `MAJOR.MINOR.PATCH`, increment the:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

Eg. `0.1.0`

## Install the Terraform CLI

### Considerations with the Terraform CLI changes
Terraform CLI Installation instructions has changed due to gpg keyring changes. So incorporate the changes as per the Offical Terraform CLI guide to the script.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distribution
This project is built against Ubuntu.
Please consider checking your linux distribution and change accordingly.

[Check OS version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS Version:
```
$ cat /etc/os-release 

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring the Bash Scripts
While fixing the Terraform CLI Installation gpg depreciation issue, existing bash script were to be updated. So we created a new bash script to install the Terraform CLI.

The bash script is located at [./bin/install_terraform_cli.sh](./bin/install_terraform_cli.sh).

- This will keep the Gitpod Task File tidy [.gitpod.yml](.gitpod.yml).
- This will allow us an easier to debug and execute manually Terraform CLI install.
- This will allow better portability to other projects that might require to install the Terraform CLI.

### Shebang

A Shebang (pronounced Sha-bang) tells the bash script what program will interpret the script. eg. `#!/bin/bash`

ChatGPT recommended this format for bash: `#/usr/bin/env bash` :
- For portability for different OS Distributions
- Will search the user's Path for the bash executable

[Shebang Wiki](https://en.wikipedia.org/wiki/Shebang_(Unix))

### Execution Considerations

When executing the bash script we can use `./` shorthand notation to execute the bash script.

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml then we need to point the script to a program to interpret it.

eg. `source ./bin/install_terraform_cli`

### Linux Permissions Considerations

In order to make our bash scripts executable we need to change linux permission for the fix to be executable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```

Alternatively,
```sh
chmod 744 ./bin/install_terraform_cli
```

### Github Lifecycle (Before, Init, Command)
We need to be careful when using the Init because it will not rerun if we restart an existing workspace.
https://www.gitpod.io/docs/configure/workspaces/tasks

### Working with Environment Variables

#### env command

List out all environment variables using the `env` command.
`grep` can be used to filter the specific env var eg. `env | grep AWS_`

#### Set and Unset Environment Variables

##### On the terminal,
- Set using `export HELLO=world`
- Unset using `unset HELLO`
- Temporarily also we can set environment variable when just running a command - 
    ```sh
    HELLO='world' ./bin/install_terrform_cli
    ```
- Set an env var without writing export -
    ```sh
    #!/usr/bin/env bash
    HELLO='world'
    echo $HELLO
    ```
#### Printing Environment Variables

Using `echo $HELLO`

#### Scoping of Environment Variables

By default, Environment Variable has scope upto that current bash terminal where it is s set.

Set env var in the bash profile eg. `.bash_profile`, if you require to persists the env variable in all the bash terminals.

#### Persist Environment Varibles in the Gitpod

Environment variables can be persisted into the gitpod environment, so that it remains set in all the future workspaces launched bash terminals -

```sh
gp env HELLO='world'
```

We can also set the environment variables in the `.gitpod.yml` but it can contain only the non-sensitive names. 

## References
- [Semantic Versioning](https://semver.org/)
