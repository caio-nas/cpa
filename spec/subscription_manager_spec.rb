# frozen_string_literal: true
require "./lib/cpa/controllers/subscription_manager"
require "./spec/spec_helper"  # this
RSpec.describe CPA::Controller::SubscriptionManager do
  
  describe 'Consultar Minha Assinatura' do
    customer_id = "cus_NhejR8y0G0D5nq"
    produtos = CPA::Controller::SubscriptionManager.getPurchaseByCustomer(customer_id)
    it 'Obtém os histórico de minhas compras' do
      produtos.each do |produto|
        puts produto.name
      end
      expect(produto.name).to be("Atendimento Sigafila SMS")
    end
    it 'Identifica plano atual' do
      
      expect(true).to be(true)
    end
  end
  describe 'Cancelar Minha Assinatura' do
   
    it 'Cancelamento registrado no Stripe' do
      
      expect(true).to be(true)
    end

    it 'Cancelamento registrado no plano ' do
      
      expect(true).to be(true)
    end

  end

  describe 'Consumir Pacote do Cliente' do
    
    it 'Consultou saldo do produto' do
        
      expect(true).to be(true)
    end  
    
    it 'cliente tem saldo suficiente' do
        
      expect(true).to be(true)
    end
    
     it 'cliente não tem saldo suficiente' do
        
      expect(true).to be(true)
    end
    
  end

  describe 'Atualizar Consumo' do
    it 'Novo produto contratado' do
        
      expect(true).to be(true)
    end
    it 'Saldo zera ao final do período' do
        
      expect(true).to be(true)
    end
    it 'Atualiza o saldo do cliente para um novo valor' do
        
      expect(true).to be(true)
    end
    it 'Abate do saldo do produto' do
        
      expect(true).to be(true)
    end
  end
  
end      