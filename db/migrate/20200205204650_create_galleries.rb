class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
    add_index :galleries, :user_id
  end
end

