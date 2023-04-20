# frozen_string_literal: true

module CPA
  module StripeWrapper
    class Customer < Stripe::Customer

    
      def self.create_bulk(customers) #cria client stripe em lote. Útil se for necessário para importar  clientes do sistema de origem para o stripe
        customers.each do |customer|

          createdCustomer = self.create(customer) #todo observar o que ocorre quando volta nil por já ter.  Anexar a lista de rejeitados para devolver junto, são objetos diferentes dentro delas
          if createdCustomer.nil?
            listRejected << customer
          else
            listCreated << createdCustomer
            createdCustomer = nil
          end
        end
        return listCreated
      end
      
      def self.create(param )       #cria um cliente por vez e retorna
        
        customers = self.getByEmail(param[:email])  #verifica se já tem um customer com esse email, para evitar criar duplicado
        if customers.nil? || customers.data.empty?

          attributes = {
            name: param[:name],
            email: param[:email],
            address: {
              city: param[:city],
              country: param[:country],
              line1: param[:line1],
              line2: param[:line2],
              postal_code: param[:postal_code],
              state: param[:state]
            },
            phone: param[:phone]
          }
          return Stripe::Customer.create(attributes)
        end
        
        #tem um customer com o mesmo email, não cria e retorna vazio
        raise CPA::StripeWrapper::CustomerCreationError.new("E-mail Já cadastrado!")
        return nil 
      end

      def self.getByEmail(param_email)
        # Procurar por clientes com o email especificado
        return  Stripe::Customer.list ({email:param_email} )
      end

      

    end #end os Customer class

    class CustomerCreationError < StandardError
      def initialize(msg = "Erro na criação de usuário")
        super
      end
    end
  end
end