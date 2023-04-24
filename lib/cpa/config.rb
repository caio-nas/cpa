# frozen_string_literal: true

module CPA
  # --
  # --
  # --
  class Config
    attr_accessor :stripe_api_key, :database_config, :endpoint_secret

    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end

    def database_config=(db_conf)
      @database_config = db_conf
      CPA::Database.init_config
    end
    def stripe_api_key=(key)
      @stripe_api_key = key
      CPA::StripeWrapper::StripeAPI.init_config
    end
  end
end