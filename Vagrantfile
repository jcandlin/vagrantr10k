# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "puppetlabs/centos-6.5-32-puppet"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://tom.davidson.me.uk/dev/vagrant/centos63-32.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "192.168.33.10"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.

config.vm.provision :puppet do |puppet|
  puppet.manifests_path = "manifests"
  puppet.manifest_file  = "default.pp"
  puppet.module_path = 'modules'
end

config.vm.define "puppetmaster" do |pm|
  pm.vm.box = "puppetlabs/centos-6.5-32-puppet"
  pm.vm.hostname = "puppetmaster"
  pm.vm.network "private_network", ip: "192.168.50.3"
  pm.vm.network :forwarded_port, guest:80, host:9091
end

config.vm.define "rabbitmq1" do |rmq|
  rmq.vm.box = "puppetlabs/centos-6.5-32-puppet"
  rmq.vm.hostname = "rabbitmq1"
  rmq.vm.network "private_network", ip: "192.168.50.2"
  rmq.vm.network :forwarded_port, guest:80, host:9090
end

end
