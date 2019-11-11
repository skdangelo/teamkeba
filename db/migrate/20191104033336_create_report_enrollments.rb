class CreateReportEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_view :report_enrollments
  end
end
