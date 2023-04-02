module StripeManager
  module Config
    @StripeApiKey =
      "sk_test_51MoRlvHYLHKZTvhNH4PMOcCqU2XskC83pqeAoXh6yuLBAfLiTGjl9qwpPs0uvzFhp8ZzGouxuy1WWrGHaB4YQ2cJ002RNeTBmE"
    
    def self.open
       StripeManager::API::Stripe.open(@StripeApiKey)
    end
  end
end
