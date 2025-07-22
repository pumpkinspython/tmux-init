# TMit

**TMit** is a simple tool that allows you to configure and launch your tmux sessions and windows using a YAML file. Easily define your session layout, window names, and commands to run in each pane—no need to manually set up your environment each time.

## Features

- Define tmux sessions, windows, and panes with YAML
- Automatically boot up your full dev environment
- Clean and reusable configuration
- Works well with `.bash_profile` for seamless startup

## 📦 Required Dependencies

To use **TMit**, you’ll need the following installed:

- [tmux](https://github.com/tmux/tmux)
- [yq](https://github.com/mikefarah/yq) (YAML processor for bash)

## Getting started
1. **Clone and move the project**
``` bash
git clone git@github.com:pumpkinspython/tmux-init.git
mv tmux-init ~/.tmit
```
2. **Update the config.yaml** to define your desired sessions:
*found in `~/.tmit/config.yaml`*
``` yaml
sessions:
  - name: main
    windows:
      - name: bash
        command: bash
  - name: files
    windows:
      - name: lf
        command: lf ~
  - name: docker
    windows:
      - name: lazydocker
        command: lazydocker
      - name: stats
        command: docker stats
  - name: system
    windows:
      - name: htop
        command: htop
      - name: disk
        command: watch df
```
3. **Link TMit to your shell startup**
In your `.bash_profile`,
``` bash
/bin/bash ~/.tmit/init.sh
```
Reload your shell
``` bash
source ~/.bash_profile
```
4. **🎉 The setup is complete**
