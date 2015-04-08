# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"

  config.vm.synced_folder "~/src/", "/src"
  config.vm.synced_folder "~/Downloads/", "/downloads"

  config.vm.provision "shell", path: "provision.sh"

end
