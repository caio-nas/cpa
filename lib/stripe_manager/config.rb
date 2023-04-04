# frozen_string_literal: true

module StripeManager
  # --
  # --
  # --
  class Config
    attr_accessor :stripe_api_key, :database_config

    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end

    def database_config=(db_conf)
      @database_config = db_conf
      StripeManager::Database.init_config
    end
    def stripe_api_key=(key)
      @stripe_api_key = key
      StripeManager::API::StripeAPI.init_config
    end
  end
end