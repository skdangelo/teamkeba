class AddImageToProgram < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :image, :string
  end
end
