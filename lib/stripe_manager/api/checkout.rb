# frozen_string_literal: true

module StripeManager
  # --
  # --
  class Checkout
    def self.create(param)
      Stripe::Checkout::Session.create(param)
    end
  end
end
