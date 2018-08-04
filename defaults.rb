# -*- mode: ruby -*-
# vi: set ft=ruby :

DEFAULT_BOX = {
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
  :provisions => [],
}
