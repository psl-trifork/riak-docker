# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	# Every Vagrant virtual environment requires a box to build off of.
	config.vm.box = "grtjn/centos-7.1"

	# Forward ports related to the applications we are using via Docker in the VM.
	config.vm.network "forwarded_port", guest: 8087, host: 8087
	config.vm.network "forwarded_port", guest: 8098, host: 8098
	
	# Provide a shell script for configuring the Vagrant guest OS.
	config.vm.provision "shell" do |s|
		s.path = File.join(File.dirname(__FILE__), "provisioner.sh")
	end

	config.vm.provider "virtualbox" do |v|
		v.memory = 4096
		v.cpus = 2
	end	
end
