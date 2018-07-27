# modern.IE VMs with Vagrant and Virtual Box

A simple way to start a Windows VM with IE/ Edge browser installed. Meant to be used for testing purposes. See <http://blog.syntaxc4.net/post/2014/09/03/windows-boxes-for-vagrant-courtesy-of-modern-ie.aspx> for more info.

## How to use

### Install dependencies
Install both [vagrant](https://www.vagrantup.com/downloads.html) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads) if you don't already have them.

### Clone the repository

```sh
:; git clone https://github.com/tnguyen14/ievms.git
```

### Install Vagrant plugins

```sh
:; vagrant plugin install vagrant-triggers
:; vagrant plugin install vagrant-vbguest
```

### Start the VMs
You can start any version of IE you'd like with just a simple command:

```sh
:; vagrant up ie6-xp
:; vagrant up ie6-xp
:; vagrant up ie7-vista
:; vagrant up ie8-win7
:; vagrant up ie9-win7
:; vagrant up ie10-win7
:; vagrant up ie11-win7
:; vagrant up ie10-win8
:; vagrant up ie11-win81
:; vagrant up msedge-win10
```

You might see many SSH authentication failure warnings, and eventually timed out. This is expected. The Windows VM with IE should already been opened via a GUI with Virtualbox.

### Networking

You can access the host's network from inside the VM by going to http://192.168.33.1
