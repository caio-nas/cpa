# frozen_string_literal: true

module StripeManager
  # --
  # --
  # --
  class Config
    attr_accessor :stripe_api_key

    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end
  end
end