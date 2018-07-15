#!/usr/bin/env ruby
require_relative('../catapult')
# input_file_path = ARGV[0]
input_file_path = '/tmp/raw_addresses_path.txt'
# TODO: check if configmap exists and if so. no op
ruby_object = Catapult::Addresses.parse(input_file_path)
# TODO: write to config map
require 'pp'
pp ruby_object
