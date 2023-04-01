
module StripeManager
  module Products

    def list_products
      require 'stripe'
      Stripe.api_key = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'

      Stripe::Product.list({limit: 3})
      
    end 
  end
end
