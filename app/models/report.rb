class Report < ApplicationRecord
    def report_enrollments
      @reports = Report::report_enrollments
      respond_to do |format|
        format.html {}
      end
    end
end
