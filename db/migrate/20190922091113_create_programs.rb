class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :title
      t.text :description
      t.string :tag_text
      t.decimal :cost
      t.date :start_date
      t.date :end_date
      t.text :meet_times
      t.string :address
      t.integer :user_id
      t.timestamps
    end
    add_index :programs, :user_id
  end
end
