# frozen_string_literal: true

module CPA
  module StripeWrapper
    # --
    # --
    class Checkout
      def self.create(param)
        Stripe::Checkout::Session.create(param)
      end
    end
  end
end
