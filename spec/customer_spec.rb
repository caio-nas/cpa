# frozen_string_literal: true
require './lib/CPA/stripe_wrapper/customer'
require "./spec/spec_helper"  # this
RSpec.describe CPA::StripeWrapper::Customer do
  
  describe 'Cadastrar cliente no Stripe' do
      
      #limpa o banco de testes anteriores, caso existam
      deletedCustomer = CPA::StripeWrapper::Customer.getByEmail('john@example.com')
      if !deletedCustomer.empty?
      CPA::StripeWrapper::Customer.delete( deletedCustomer[:data][0][:id])   
      end
      
      createdCustomer = CPA::StripeWrapper::Customer.create({
      name: 'John Doe',
      email: 'john@example.com',
      line1: '123 Main St',
      city: 'Anytown',
      postal_code: '12345',
      state: 'CA',
      country: 'US'
    })
    
    it 'Novo cliente cadastrado' do
      expect( CPA::StripeWrapper::Customer.retrieve(createdCustomer[:id])).to be_a(Stripe::Customer)
    end

    it 'Evita que clientes Stripe com o mesmo email sejam cadastrados' do
        begin
          createdCustomer2 = CPA::StripeWrapper::Customer.create({
            name: 'John Doe2',
            email: 'john@example.com',
            line1: '1233 Main St2',
            city: 'Anytown 2',
            postal_code: '123456',
            state: 'BA',
            country: 'BR'
          })
        rescue => exception
          expect(exception).to be_a(CPA::StripeWrapper::CustomerCreationError)
        end          
    end      

    it 'Apaga cliente stripe que foi criado' do
      deletedCustomer = CPA::StripeWrapper::Customer.retrieve(createdCustomer.id) 
      deletedCustomer.delete
      deletedCustomer = CPA::StripeWrapper::Customer.retrieve(createdCustomer.id) 
      expect( deletedCustomer.deleted).to be(true)
    end
  end
  describe 'Cadastrar cliente Stripe no banco CPA' do
    it 'Cria e apaga cliente stripe' do
      # Print information about the database table
      require './lib/CPA/DB/customer'
      #require './lib/CPA/stripe_wrapper/customer'
   
      dbcustomer = CPA::DB::Customer.new(name: "John", email: "john@example.com")
      dbcustomer.save
      dataCustomers = CPA::DB::Customer.all
      puts "--- TABELA ---"
      dataCustomers.each.with_index(1) do |customer, index|
        puts  "#{index}" + " - " + customer.name + " - " +  customer.email
        customer.destroy
        dbcustomer.save
      end
      puts "--------------"
     
      dataCustomers = CPA::DB::Customer.all
      puts "--- TABELA ---"
      dataCustomers.each.with_index(1) do |customer, index|
        puts  "#{index}" + " - " + customer.name + " - " +  customer.email
        
      end
      puts "--------------"
      expect(dataCustomers.empty?).to be(true)
    end
  end

  
end      