# frozen_string_literal: true

require 'yaml'
require 'active_record'

db_config_file = File.open(File.expand_path(File.dirname(__FILE__)) + '/db_conf.yaml')
db_config = YAML.load(db_config_file)
puts db_config

ActiveRecord::Base.establish_connection(db_config)
