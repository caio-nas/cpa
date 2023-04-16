# frozen_string_literal: true

module CPA
  module StripeWrapper
    # Stripe Maneger module
    class Products < Stripe::Product
      # Module Products
      def self.list
        super
      end

      def self.retrieve(id)
        super(id)
      end
    end
  end
end
