# frozen_string_literal: true
require './lib/cpa/db/migrations/customer_migration.rb'
require './lib/cpa/db/customer_model'
require "./spec/spec_helper"  # this
RSpec.describe CPA::DB::Customer do
  
#  CPA::DB::CreateCustomerTable.migrate(:up)

  describe 'Cadastrar cliente no banco CPA' do
    it 'Cria cliente CPA' do
      # Print information about the database table
      
      dbcustomer = CPA::DB::Customer.new(
                                        name: "John", 
                                        email: "john2@example.com", 
                                        phone: "7199999999"
                                        )
      if !dbcustomer.save
        puts dbcustomer.errors.full_messages.join(', ')
      end     

      self.displayTable(CPA::DB::Customer)
    
      customer = CPA::DB::Customer.find(dbcustomer.id)
      expect(customer[:name]).to eq(dbcustomer[:name])
    end

   

    it 'Apaga cliente CPA' do
      dataCustomers = CPA::DB::Customer.all

      dataCustomers.each.with_index(1) do |customer, index|
        customer.destroy
      end
   
      self.displayTable(CPA::DB::Customer)
      
      expect(true).to be(true)
    end
  end

end      