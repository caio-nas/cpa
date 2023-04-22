# frozen_string_literal: true

module CPA
  module DB
    class Customer < ActiveRecord::Base
      validates :name, presence: true
      validates :phone, presence: true
      validates :email, presence: true , uniqueness: true
      validates :idCPA, uniqueness:  { allow_blank: true }
    
    

      # Define um método que retorna o nome e email concatenados
      def displayRecord
        return "#{name} <email:#{email}> <phone:#{phone}> <idCPA:#{idCPA}>"
      end
     

    end
  end
end
