# frozen_string_literal: true

module CPA
    module Controller
        class SubscriptionManager < CPA::BaseController
            
            
            def self.getCPACustomer(email)


            end
            
            
            
            
            def self.getPurchaseByCustomer(customer_id) 
                customer = CPA::StripeWrapper::Customer.retrieve({
                    id: customer_id,
                    expand: ['subscriptions']
                  })
                

                #subscriptions = customer[:expand]
                 customer.subscriptions.data.each do |subscription|
                    subscription.items.data.each do |item|
                        products << item.price.product
                        
                    # faça algo com o objeto product
                    end
                end
               
            end
        
        
        
        end
    end
end