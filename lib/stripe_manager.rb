# frozen_string_literal: true

require 'active_record'
require 'forwardable'
require 'stripe'

require_relative 'stripe_manager/version'

require 'stripe_manager/init'
require 'stripe_manager/config'
# ---
module StripeManager
  @config = StripeManager::Config.setup
  class << self
    extend Forwardable

    attr_reader :config

    def_delegators :@config, :stripe_api_key, :stripe_api_key=
    def_delegators :@config, :database_config, :database_config=

  end


  puts 'Loaded'

end
