class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :title
      t.text :description
      t.decimal :cost
      t.datetime :start_date
      t.datetime :end_date
      t.text :meet_times
      t.text :location
      t.integer :user_id
      t.timestamps
    end
  end
end
