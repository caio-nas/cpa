# frozen_string_literal: true

module CPA
    module Controller
        class SubscriptionManager < CPA::BaseController
            require './lib/cpa/db/customer'
            
            def self.getCustomer(email)
                

                customerStripe = CPA::StripeWrapper::Customer.getByEmail(email)
                
                
             
                dbcustomer = CPA::DB::Customer.new(name: "John", email: "john@example.com")
                dbcustomer.save

                
                createdCustomer = CPA::StripeWrapper::Customer.create({
                    name: 'John Doe',
                    email: 'john@example.com',
                    line1: '123 Main St',
                    city: 'Anytown',
                    postal_code: '12345',
                    state: 'CA',
                    country: 'US'
                  })
                
                
                
                dbcustomer = CPA::DB::Customer.new(name: "John", email: "john@example.com")


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