# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :app do |app|
    app.vm.host_name = "wallgig-net-app"
    app.vm.box = "opscode-debian-6.0.8"
    app.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_debian-6.0.8_chef-provisionerless.box"
    app.vm.network :private_network, ip: "10.0.0.100"
    app.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  end

  config.vm.define :dbmaster do |dbmaster|
    dbmaster.vm.host_name = "wallgig-net-dbmaster"
    dbmaster.vm.box = "opscode-debian-6.0.8"
    dbmaster.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_debian-6.0.8_chef-provisionerless.box"
    dbmaster.vm.network :private_network, ip: "10.0.0.101"
    dbmaster.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end

  end

  config.vm.define :search do |search|
    search.vm.host_name = "wallgig-net-search"
    search.vm.box = "opscode-debian-6.0.8"
    search.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_debian-6.0.8_chef-provisionerless.box"
    search.vm.network :private_network, ip: "10.0.0.102"
    search.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  end
end
