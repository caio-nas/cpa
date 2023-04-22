# frozen_string_literal: true
require './lib/cpa/db/migrations/customer_migration.rb'
require 'cpa/helpers/controller'
require './lib/cpa/db/customer_model'
require './lib/cpa/stripe_wrapper/customer_wrapper'
require './lib/cpa/stripe_wrapper/products_wrapper'
module CPA
    module Controller
        class SubscriptionController < CPA::BaseController
            
            def  self.createCustomer(systemCustomer)  #Procura um cliente CPA a partir de um cliente do sistema de origem, se não tiver, cria e retorna
                customerCPA = self.getCustomer(systemCustomer[:idCPA])
                if  customerCPA.nil?
                    customerCPA = CPA::DB::Customer.new(systemCustomer)
                    customerCPA.save
                end
                return customerCPA
            end
                       
            def self.getCustomer(idCPA)
                if !idCPA.empty? #Não tem ainda cliente no banco CPA
                    dbcustomer = CPA::DB::Customer.retrieve(idCPA)
                end
                return dbcustomer
            end

            def self.getStripeCustomer ()
                customerStripe = CPA::StripeWrapper::Customer.retrieve(idCustomer)
                        
                            
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
                products = []
                
                customer = CPA::StripeWrapper::Customer.retrieve({
                    id: customer_id,
                    expand: ['subscriptions']
                })
                customer[:subscriptions].data.each do |subscription|
                     subscription.items.each  do |item| 
                        products <<  CPA::StripeWrapper::Products.retrieve(item.price.product)
                     end
                end
                #subscriptions = customer[:expand]
             
                return products
            end


            
        end
    end
end