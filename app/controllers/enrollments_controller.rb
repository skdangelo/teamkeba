class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.enrollments.create(program: current_program)
    redirect_to program_path(current_program)
  end

  private

  def current_program
    @current_program ||= Program.find(params[:program_id])
  end  
end
