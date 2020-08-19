# An Remote Development Environment for Python Using Docker Containers and Visual Studio Code

## Purpose
1. To develop Python 3 applications directly on a Raspberry Pi 4 using your own development machine.
1. To provide a template project to connect remotely to a Raspberry Pi 4 and for building Python Applications for Raspberry Pi 4 using Visual Studio Code, along with the associated tools.
2. A containerized development environment using the [Remote-Containers](https://code.visualstudio.com/docs/remote/containers) extension.

## Development Machine Requirements
1. [Visual Studio Code](https://code.visualstudio.com/)
2. [Remote - Containers extension for Visual Studio Code](https://aka.ms/vscode-remote/download/extension)
3. [Docker](https://docs.docker.com/install/#supported-platforms)

## Raspberry Pi 4 Requirements
1. [Git](https://projects.raspberrypi.org/en/projects/getting-started-with-git)
2. [Docker](https://docs.docker.com/install/#supported-platforms)

## Installed Frameworks
5. Docker (Docker In Docker)
6. Git 
7. Python 3.7
8. PipEnv
9. Ruby
10. Curl, Vim

## Developing inside a Container Using VSCode
1. Clone this repository or copy just the `.devcontainer` and `.vscode` folder into your own local git repository folder. You can also run the following script in your terminal.
```bash
bash <(wget -qO- https://raw.githubusercontent.com/senglin/python-rpi4-workspace/master/install.sh)
```
2. Start VS Code.
3. Modify `.vscode/settings.json` with the username and location of the Raspberry Pi 4 device, accessible from your development machine.
3. In a new window, click on the quick actions Status Bar item in the lower left corner.
3. Select **Remote-Containers:Reopen in Container**.
4. From the menu, select **Terminal -> New Terminal**.  You can now use the installed tools to clone, develop and build in your RPi4 device.
5. As an example, you can try out this [Hello World]() project for the Raspberry Pi 4.


### Debugging Using VSCode

For projects that has `Pipfile`, you may execute the following line to create a virtual environment
```
$ pipenv install --dev
```

Set VS Code to use the created Python Virtual Environment.  Use `.venv/bin/python` which should be in the current project folder.

VS Code will have access to all modules that were installed using `pipenv`.

## Expectation
1. The container app reuses ssh private key configuration from the host.  SSH-AGENT settings are forwarded to the container application.
2. `PIPENV_VENV_IN_PROJECT` has been set so that the command `pipenv install` will install / create virtual environments in the current project folder, rather than the user home folder on the Raspberry Pi.