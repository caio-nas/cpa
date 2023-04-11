require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'test.db')

class CreateCustomerTable < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |table|
      table.string :name
      table.string :email
      table.timestamps
    end
  end

end

# Create the table
CreateCustomerTable.migrate(:up)