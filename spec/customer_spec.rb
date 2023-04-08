# frozen_string_literal: true
require './lib/stripe_manager/api/customer'
require "./spec/spec_helper"  # this
RSpec.describe StripeManager::Customer do
  
        describe 'Cadastrar cliente no Stripe' do

          #limpa o banco de testes anteriores
           deletedCustomer = StripeManager::Customer.checkEmail('john@example.com')
           StripeManager::Customer.delete( deletedCustomer[:data][0][:id])   
                  
           createdCustomer = StripeManager::Customer.create({
            name: 'John Doe',
            email: 'john@example.com',
            line1: '123 Main St',
            city: 'Anytown',
            postal_code: '12345',
            state: 'CA',
            country: 'US'
              })

          
          it 'Novo cliente cadastrado' do
            expect( StripeManager::Customer.retrieve(createdCustomer[:id])).to be_a(Stripe::Customer)
          end


          it 'Cliente Stripe com mesmo email não foi cadastrado' do
              begin
                createdCustomer2 = StripeManager::Customer.create({
                  name: 'John Doe2',
                  email: 'john@example.com',
                  line1: '1233 Main St2',
                  city: 'Anytown 2',
                  postal_code: '123456',
                  state: 'BA',
                  country: 'BR'
                    })
              rescue => exception
                expect(exception).to be_a(StripeManager::CustomerCreationError)
               # expect(Stripe::Customer.retrieve(createdCustomer2.id)).to be(nil)
               
              end          
          
          end      
         

          it 'Cliente que foi criado está apagado' do
            deletedCustomer = StripeManager::Customer.retrieve(createdCustomer.id) 
            deletedCustomer.delete
            deletedCustomer = StripeManager::Customer.retrieve(createdCustomer.id) 
            expect( deletedCustomer.deleted).to be(true)
          end
       end
end      