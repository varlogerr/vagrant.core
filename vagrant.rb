# -*- mode: ruby -*-
# vi: set ft=ruby :

load File.expand_path("#{ File.dirname(__FILE__) }/lib/Hash.rb")
load File.expand_path("#{ File.dirname(__FILE__) }/defaults.rb")

Vagrant.configure("2") do |config|
  BOXES.each_index do |index|
    box_conf = DEFAULT_BOX.deep_merge(BOXES[index])
    box_defaults = box_conf[:defaults]
    env_vars = box_conf[:env_vars]
    provisions = box_conf[:provisions]

    config.vm.define box_conf[:box_name], primary: index == 0 ? true : false do |box|
      the_vm = box.vm

      # configure box
      the_box = box_conf[:box].split(":")
      the_vm.box = the_box[0]
      if the_box.count > 1
        the_vm.box_version = "=#{ the_box[1] }"
      end
      the_vm.box_check_update = false

      # configure hostname
      the_vm.hostname = box_conf[:box_host]

      # configure ip
      if box_defaults[:ip] != nil || ENV.has_key?(env_vars[:ip])
        the_ip = ENV[env_vars[:ip]] || box_defaults[:ip]
        the_vm.network "private_network", ip: the_ip
      end

      the_vm.provider "virtualbox" do |vb|
        # configure gui
        vb.gui = box_defaults[:gui]
        if ENV.has_key?(env_vars[:gui])
          vb.gui = Integer(env_vars[:gui]) == 0 ? false : true
        end
        # configure memory
        vb.memory = ENV.has_key?(env_vars[:memory]) ? Integer(ENV[env_vars[:memory]]) : box_defaults[:memory]
        # configure cpus
        vb.cpus = ENV.has_key?(env_vars[:cpus]) ? Integer(ENV[env_vars[:cpus]]) : box_defaults[:cpus]

        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end

      provisions.each do |provision|
        the_vm.provision *provision
      end
    end
  end
end
