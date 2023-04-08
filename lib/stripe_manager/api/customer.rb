# frozen_string_literal: true

module StripeManager
 
  class Customer
                
    def self.create(param )
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
      customers = self.checkEmail(attributes[:email])  #verifica se já tem um customer com esse email, para evitar criar duplicado
      if customers.nil? || customers.data.empty?
        return Stripe::Customer.create(attributes)
      else
        raise StripeManager::CustomerCreationError.new("E-mail Já cadastrado!")
      end
      return nil #tem um customer com o mesmo email, não cria e retorna vazio
    end

    def self.checkEmail(param_email)
      # Procurar por clientes com o email especificado
      customers = Stripe::Customer.list ({email:param_email} )
      # Verificar se a lista de clientes retornou algum resultado
      return customers
    end

    def self.delete(id)
      Stripe::Customer.delete(id)
    end

    def self.retrieve(id)
      Stripe::Customer.retrieve(id)
    end



   

  end #end os Customer class




class CustomerCreationError < StandardError
  def initialize(msg = "Erro na criação")
    super
  end
end

end