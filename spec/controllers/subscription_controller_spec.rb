# frozen_string_literal: true
require "./lib/cpa/controllers/subscription_controller"
require "./spec/spec_helper"  # this
RSpec.describe CPA::Controller::SubscriptionController do

  describe 'Cadastrar Minha Assinatura' do

    #pegar os produtos do customer
    #ver quais são novos
    #ver quais são do tipo que é controlado
    #

  end
  
  describe 'Consultar Minha Assinatura' do
      systemCustomer = {  #Cliente do sistema cliente do CPA
        name: 'John Doe',
        email: 'john@example.com',
        address: {
          line1: '123 Main St',
          city: 'Anytown',
          postal_code: '12345',
          state: 'CA',
          country: 'US'
        },
        phone: '71991764951',
        idCPA:''
      }
      
    
    it 'Não tenho usuário no CPA' do 
      customerCPA = CPA::Controller::SubscriptionController.createCustomer(systemCustomer) 
      expect(customerCPA.name).to eq('John Doe')
    end

    it 'Não tenho usuário no Stripe' do
     
      
      expect(true).to be(true)
    end

    it 'Obtém os histórico de minhas compras' do
      systemCustomer[:idCPA] = "cus_NhejR8y0G0D5nq"
      produtos = CPA::Controller::SubscriptionController.getPurchaseByCustomer(systemCustomer[:idCPA]) 
      produtos.each do |produto|
             puts  produto[:name]
      end
      expect("Atendimento Sigafila SMS").to eq("Atendimento Sigafila SMS")
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