# frozen_string_literal: true

module CPA
  module StripeWrapper
    # Stripe Maneger module
    class Products
      # Module Products
      def self.list_products
        Stripe::Product.list({ limit: 3 })
      end

      def self.get(id)
        Stripe::Product.retrieve(id)
      end
    end
  end
end
