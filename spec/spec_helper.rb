# frozen_string_literal: true
require 'yaml'

require "stripe_manager"

db_config_file = File.open(File.expand_path(File.dirname(__FILE__)) + '/db_conf.yaml')
db_config = YAML.load(db_config_file)

StripeManager.stripe_api_key = "sk_test_51MoRlvHYLHKZTvhNH4PMOcCqU2XskC83pqeAoXh6yuLBAfLiTGjl9qwpPs0uvzFhp8ZzGouxuy1WWrGHaB4YQ2cJ002RNeTBmE"
StripeManager.database_config = db_config

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
