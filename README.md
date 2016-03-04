# modern.IE VMs with Vagrant and Virtual Box
## How to use

### Install dependencies
Install both [vagrant](https://www.vagrantup.com/downloads.html) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads) if you don't already have them.

### Clone the repository

```sh
:; git clone https://github.com/tnguyen14/ievms.git
```

### Install Vagrant triggers
`vagrant up <IE version>` will run a script which will check your current box installations for an existing Windows box and install the correct one based on what version of IE you provide.

```sh
:; vagrant plugin install vagrant-triggers
```

### Start the VMs
You can start any version of IE you'd like with just a simple command:

```sh
:; vagrant up ie8 # or ie9, ie10, ie11, win8ie10, win81ie11
```

**Note** if you already have these virtual boxes downloaded, you can run

```sh
:; vagrant up <IE version> local/file/path
```

Also note that the machine names will be **different** than the box names (`ie8` will create a box named `win7-ie8` for example). Here is the full list of machine names and their corresponding box names

```
ie8 => win7-ie8
ie9 => win7-ie9
ie10 => win7-ie10
ie11 => win7-ie11
win8ie10 => win8-ie10
win81ie11 => win81-ie11
```
