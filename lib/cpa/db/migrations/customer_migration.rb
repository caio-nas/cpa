require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'test.db')
module CPA
  module DB
    class CreateCustomerTable < ActiveRecord::Migration[7.0]
      def change
        create_table :customers do |table|
          table.string :name
          table.string :email
          table.json :address
          table.string :phone
          table.string :idCPA
          table.timestamps
        end
      end
    end

    # Create the table
    if !ActiveRecord::Base.connection.table_exists?('customers')
      CreateCustomerTable.migrate(:up)
    end
  end
end