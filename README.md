# Virtual Machine for [Law and Order in LA - To Process and Search with ELK](https://2016.javazone.no/program/law-and-order-in-la-to-process-and-search-with-elk)

This repository contains setup files for a virtual machine using Vagrant and VirtualBox. The VM will contain all necessary project files for the [Law and Order in LA - To Process and Search with ELK](https://2016.javazone.no/program/law-and-order-in-la-to-process-and-search-with-elk) workshop.

## Setup

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install [Vagrant](https://www.vagrantup.com/)
3. If you have Git, clone this repository. Otherwise download the content as a ZIP archive and unpack it somewhere.
4. Open a command line interface/shell (PowerShell or Cmd on Windows, Terminal on Mac, your favourite terminal emulator on Linux)
5. Change directory to the location of this repository's files.
6. Run: `vagrant up`
7. Get some coffee, eat a sandwich or surf the web or something, this will take about 10 minutes depending on your internet connection and computer.
8. `vagrant ssh` will SSH onto the VM from the shell.
9. When you want to stop the VM run `vagrant halt`, or shut it down from the GUI or within an SSH session.

## Notes

### Host-only interface IP address

The Host-Only Ethernet Adapter may be assigned the wrong IP address the first time it starts as VirtualBox may use DHCP to assign one. `192.168.13.1` is typical instead of the configured `192.168.13.37`. Running `vagrant halt` and `vagrant up` again, should fix this. Disabling VirtualBox's DHCP server before configuring the VM the first time also fixes the issue, but in case you want this for your other VMs, I recommend just shutting down and starting the VM through Vagrant.

### Warnings/Red output during setup

Oracle's Java installer uses a verbose `wget` to download Java, which is very noisy. So you'll see a lot of red progress indicators on Windows (possibly on other OSes as well).

### Guest additions

The VirtualBox guest additions that are pre-installed are outdated. Updating them is not required, but you may if you'd like.

If you install the VirtualBox guest additions plugin for Vagrant, it can update them automatically for you: `vagrant plugin install vagrant-vbguest` This can be a bit of a hassle on Windows, as your username may contain spaces. In that case, you need to change the `VAGRANT_HOME` environment variable to point to a directory with no spaces in the name. Copy the contents of your `C:\users\Your Name\.vagrant.d\` directory to the new home, and run the plugin installer again. Now you can uncomment the guest addition line in [Vagrantfile], and this should fix the problem. Note that you may have to run `vagrant up --provision` or `vagrant provision` to have the setup scripts run when the guest additions plugin is used.

### RAM

The VM has 3 GiB of RAM by default. If you want to increase performance, you may increase the `v.memory` in [Vagrantfile] to about half of what you have on your system. DO NOT SET THIS HIGHER THAN 75% OF YOUR SYSTEM'S RAM.

### CPUs

The VM has 2 cores by default. If you want to increase performance, you may increase the `v.cpus` in [Vagrantfile] to half of the number of logical cores on your system. DO NOT SET THIS HIGHER THAN HALF THE NUMBER OF LOGICAL CORES ON YOUR SYSTEM.

### GUI

Open up VirtualBox Manager, and you will find the VM is running (unless you shut it down with `vagrant halt`). Select the VM and click Show to open a desktop environment.

The keyboard configuration is set to a US layout by default. You can change this from the GUI or command line. From the GUI you will find the keyboard configuration in the bottom right corner. Right click `US` and select `Keyboard Layout Handler Settings`, uncheck `Keep Systems Layout` and add your layout in the menu on the left and remove the `US` layout if you want to. From a shell, you can change the Systems Layout with `sudo dpkg-reconfigure keyboard-configuration`. This will take you through a configuration wizard, the 105 key layout should work for most, then change the language in the next couple of menus and leave the rest at their defaults.

### SSH

You can use the SSH client provided by Vagrant by running `vagrant ssh`, but you can also manually connect using your favourite SSH client. You should be able to connect to it with the user `vagrant` on the IP address `192.168.13.37` with the password `vagrant`.
