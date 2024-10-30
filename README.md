# My Dotfiles/Configuration Manager

## Introduction

This is a collection of dotfiles and scripts for software I use on
my laptop and other systems. Scripts and settings local to this
repository are used for initial machine setup. Configurations for
individual applications are included as submodules in the `/HOME`
directory so I can develop and maintain them seperately.

## Requirements

The following software is required to bootstrap a system:

* A package manager (I use [Homebrew](https://brew.sh/) on macOS)
* [Ansible](https://www.ansible.com/community)
* [GNU Stow](https://www.gnu.org/software/stow/)
* Make (optional)

## Installation

Clone the repository a location of your choice on the machine you
want to set up.

System setup is (or will) be done using the Ansible Playbooks.
Documentation for that is TBD.

Configurations in the `./HOME` directory are installed with `stow`.
See the `Makefile` in that directory for an example of how `stow`
is used.
