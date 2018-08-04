# -*- mode: ruby -*-
# vi: set ft=ruby :

class ::Hash
  def deep_merge(hash)
    merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
    self.merge(hash.to_h, &merger)
  end
end
  