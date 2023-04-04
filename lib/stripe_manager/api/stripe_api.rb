# frozen_string_literal: true

module StripeManager
  module API
    class StripeAPI
      def self.init_config
        Stripe.api_key = StripeManager.stripe_api_key
      end
    end
  end
end