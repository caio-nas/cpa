# frozen_string_literal: true

require 'active_record'
require 'forwardable'
require 'stripe'

require_relative 'cpa/version'

require 'cpa/init'
require 'cpa/config'
# ---
module CPA
  @config = CPA::Config.setup
  class << self
    extend Forwardable

    attr_reader :config

    def_delegators :@config, :stripe_api_key, :stripe_api_key=
    def_delegators :@config, :database_config, :database_config=
    def_delegators :@config, :endpoint_secret, :endpoint_secret=

  end


  puts 'Loaded'

end
