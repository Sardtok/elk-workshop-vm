Vagrant.configure(2) do |config|
  # Base the project on 32-bit Lubuntu:
  config.vm.box = "mast3rof0/lubuntu32"

  config.vm.provider "virtualbox" do |v|
    v.memory = 3072
    v.cpus = 2
  end

  config.vm.hostname = "elk-workshop"

  config.vm.network "private_network", ip: "192.168.13.37"

  # Set the src sub-directory as a shared folder at /work/src on VM
  config.vm.synced_folder "src/", "/work/src"
  
  # Installation of "VirtualBox Guest Additions" (https://github.com/dotless-de/vagrant-vbguest):
  # Make sure to install/upgrade vbguest plugin with: 
  # vagrant plugin install vagrant-vbguest
  # (Re)installing this plugin fixed the EACCES error on Windows 10 described in 
  # https://github.com/dotless-de/vagrant-vbguest/issues/189
  #
  # Uncomment the following (change version if necessary)
  config.vbguest.auto_update = true

  # Configure provisioning with shell scripts:
  # Allow piping to accept Oracle license
  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end
  # Run setup script that installs required packages, downloads ELK and workshop project files
  config.vm.provision "shell", path: "setup.sh"

end
