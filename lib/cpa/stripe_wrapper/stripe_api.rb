# frozen_string_literal: true

module CPA
  module StripeWrapper
    class StripeAPI
      def self.init_config
        Stripe.api_key = CPA.stripe_api_key
      end
    end
  end
end