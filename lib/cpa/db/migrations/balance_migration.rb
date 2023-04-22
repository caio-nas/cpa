require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'test.db')
module CPA
  module DB
    class BalanceTable < ActiveRecord::Migration[7.0]
      def change
        #Essa tabela é um resumo da fotografia atual do consumo. Ela é um resultado obtido a partir das compras ainda válidas de assinaturas e gastos do mesmo período
        create_table :balances do |table|
          table.string :idCustomer
          table.string :nameCustomer
          table.string :idProduct
          table.string :nameProduct
          table.integer :totalAmount #quantas unidades de SMS tem para gastar no período
          table.integer :totalSpent #quantas unidades de SMS foram gastas deste toral
          table.timestamps
        end
      end
    end

    # Create the table
    if !ActiveRecord::Base.connection.table_exists?('balances')
      BalanceTable.migrate(:up)
    end
  end
end