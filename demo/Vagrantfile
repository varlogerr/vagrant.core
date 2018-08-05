# -*- mode: ruby -*-
# vi: set ft=ruby :

vagrant_path = File.expand_path("#{ File.dirname(__FILE__) }/vagrant")
core_path = "#{ vagrant_path }/core"

load "#{ core_path }/boxes.rb"

BOXES = [
  {
    # box name should be unique per boxes set in 1 manifest
    :box_name => "box",
    :host     => "TheBox",
    :box    => BOX_ALIASES["ubuntu18serv"],
    :defaults => {
      :ip       => nil,
      :gui      => false,
      :memory   => 1024,
      :cpus     => 1,
    },
    :env_vars => {
      :ip       => "IP",
      :gui      => "GUI",
      :memory   => "MEMORY",
      :cpus     => "CPUS",
    },
    :provisions => [
      # [:shell, :path => "vagrant/provisioner-installers/deb-ansible-install"],
      # [:shell, :inline => "cd /vagrant/vagrant/unibook && ansible-playbook vagrantbook.yml", :privileged => false],
    ],
  },
]

load "#{ core_path }/vagrant.rb"
