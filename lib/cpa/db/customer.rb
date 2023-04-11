# frozen_string_literal: true

module CPA
  module DB
    class Customer < ActiveRecord::Base
      # Define a validação dos campos de name e email
      validates :name, presence: true
      validates :email, presence: true, uniqueness: true

      # Define um método que retorna o nome e email concatenados
      def full_name
        "#{name} <#{email}>"
      end
     
    end
  end
end
