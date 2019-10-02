class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :gender, :string
    add_column :users, :cell, :string
    add_column :users, :playeremail, :string
    add_column :users, :parent1, :string
    add_column :users, :parent1cell, :string
    add_column :users, :parent2, :string
    add_column :users, :parent2email, :string
    add_column :users, :parent2cell, :string
    add_column :users, :location, :string
    add_column :users, :homeaddress, :string
    add_column :users, :homecity, :string
    add_column :users, :homestate, :string
    add_column :users, :homezip, :string
    add_column :users, :school, :string
    add_column :users, :yearschool, :string
    add_column :users, :dob, :date
    add_column :users, :position1, :string
    add_column :users, :position2, :string
    add_column :users, :referredby, :string
  end
end
