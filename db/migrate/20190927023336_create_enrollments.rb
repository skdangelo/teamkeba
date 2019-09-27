class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :program_id
      t.timestamps
    end
    add_index :enrollments, [:user_id, :program_id]
    add_index :enrollments, :program_id    
  end
end
