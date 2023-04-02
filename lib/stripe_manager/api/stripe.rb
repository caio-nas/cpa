module StripeManager
  module API
    class Stripe
      def self.open(key)
        Stripe.api_key = key
      end
    end
  end
end