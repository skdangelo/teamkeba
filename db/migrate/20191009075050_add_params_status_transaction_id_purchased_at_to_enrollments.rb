class AddParamsStatusTransactionIdPurchasedAtToEnrollments < ActiveRecord::Migration[5.2]
  def change
    add_column :enrollments, :notification_params, :text
    add_column :enrollments, :status, :string
    add_column :enrollments, :transaction_id, :string
    add_column :enrollments, :purchased_at, :datetime
  end
end
