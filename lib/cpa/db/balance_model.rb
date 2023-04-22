# frozen_string_literal: true

module CPA
  module DB
    class Balance < ActiveRecord::Base
     
      validates :idCustomer, presence: true
      validates :nameCustomer, presence: true
      validates :idProduct, presence: true
      validates :nameProduct, presence: true
      validates :totalAmount, presence: true , numericality: { only_integer: true }
      validates :totalSpent, numericality: { only_integer: true }
      validate :spent_cannot_be_greater_than_total_amount

      private
    
      def spent_cannot_be_greater_than_total_amount
        errors.add(:totalSpent, "can't be greater than total amount") if totalSpent > totalAmount
      end
    
      public
      # Define um método que retorna o nome e email concatenados
      def displayRecord
        return " <nameCustomer:#{nameCustomer}> <nameProduct:#{nameProduct}> <totalAmount:#{totalAmount} <totalSpent:#{totalSpent}>"
      end

      def spent (amount)
        self.totalSpent += amount
        if self.totalSpent > self.totalAmount
          return false
        end
        return true
      end
     

    end
  end
end
