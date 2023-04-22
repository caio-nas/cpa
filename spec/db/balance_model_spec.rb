# frozen_string_literal: true
require './lib/cpa/db/migrations/balance_migration.rb'
require './lib/cpa/db/balance_model'
require "./spec/spec_helper"  # this
RSpec.describe CPA::DB::Balance do

  describe 'Manter Saldo' do

    idCustomer="cus_NhejR8y0G0D5nq"
    nameCustomer= "Drizzt"
    idProduct="prod_NheXcfppzqZ6I1"
    nameProduct= "SMS"

    it 'cadastro de registro saldo' do
      dbBalance = CPA::DB::Balance.new(
        idCustomer:idCustomer,
        nameCustomer: nameCustomer,
        idProduct:idProduct,
        nameProduct: nameProduct,
        totalAmount: 200,
        totalSpent:0
      )
      if !dbBalance.save
        puts dbBalance.errors.full_messages.join(', ')
      end     
     
      self.displayTable(CPA::DB::Balance)

      balance = CPA::DB::Balance.find(dbBalance.id)
      expect(balance[:id]).to eq(dbBalance[:id])
      
    end
    
    balances = CPA::DB::Balance.where(idCustomer: idCustomer,idProduct:idProduct)
    it 'encontrar registro saldo' do
      expect(balances.size).to eq(1)
    end

    it 'gastar parte do saldo' do
      balance = balances.first
      if balance.spent(100)
        balance.save
      end
      expect(balance[:totalSpent]).to eq(100)
    end

    it 'gastar todo o saldo' do
      balance = balances.first
      amount = balance[:totalAmount] - balance[:totalSpent]
      if balance.spent(amount)
        balance.save
      end
      expect(balance[:totalSpent]).to eq(200)
    end

    it 'impede gastar mais que o saldo' do
      balance = balances.first
      if balance.spent(100)
        balance.save
      end
      expect(balance.valid?).to be(false)
    end

    it 'deletar registro saldo' do
      dataBalances = CPA::DB::Balance.all

      dataBalances.each.with_index(1) do |balance, index|
        balance.destroy
      end

      self.displayTable(CPA::DB::Balance)

      
      dataBalances = CPA::DB::Balance.all 
      expect(dataBalances).to be_empty
      
    end

  end

 

end      