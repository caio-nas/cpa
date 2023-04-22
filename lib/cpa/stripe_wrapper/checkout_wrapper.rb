# frozen_string_literal: true

module CPA
  module StripeWrapper
    # --
    # --
    class Checkout < Stripe::Checkout::Session 
      def self.create(param)
        super(param)
      end
    end
  end
end
