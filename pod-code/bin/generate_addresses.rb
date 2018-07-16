#!/usr/bin/env ruby
require_relative('../lib/catapult')
require('json')
input_file_path = ARGV[0]
config_map_name = ARGV[1]
kube_config_map_helper = Catapult::ConfigMap.new
# no op if config map exists already
unless kube_config_map_helper.exists?(config_map_name)
  parsed_keys = Catapult::Addresses.parse(input_file_path)
  kube_config_map_helper.create(config_map_name, parsed_keys: ::JSON.generate(parsed_keys))
end
