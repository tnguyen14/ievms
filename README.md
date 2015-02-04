# modern.IE VMs with Vagrant and Virtual Box
## How to use

### Download the base boxes
Depending on your Internet connection, this step may take a very long to a very-very-very long time. Luckily, it is only a one-time thing and will not be needed after the first download.

You can just download only the ones you need.

Thanks the Modern.ie team for releasing these [vagrant boxes](http://blog.syntaxc4.net/post/2014/09/03/windows-boxes-for-vagrant-courtesy-of-modern-ie.aspx).

```sh
:; vagrant box add win7-ie8  http://aka.ms/vagrant-win7-ie8
:; vagrant box add win7-ie9  http://aka.ms/vagrant-win7-ie9
:; vagrant box add win7-ie10  http://aka.ms/vagrant-win7-ie10
:; vagrant box add win7-ie11  http://aka.ms/vagrant-win7-ie11
:; vagrant box add win8-ie10  http://aka.ms/vagrant-win8-ie10
:; vagrant box add win81-ie11  http://aka.ms/vagrant-win81-ie11
```
### Start the VMs
Once downloaded, you can start any version of IE you'd like with just a simple command:

```sh
:; vagrant up ie8 # or ie9, ie10, ie11, win8ie10, win81ie11
```