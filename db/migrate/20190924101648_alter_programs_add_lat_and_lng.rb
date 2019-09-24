class AlterProgramsAddLatAndLng < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :latitude, :float
    add_column :programs, :longitude, :float    
  end
end
