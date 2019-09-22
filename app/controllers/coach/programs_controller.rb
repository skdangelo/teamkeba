class Coach::ProgramsController < ApplicationController
  before_action :authenticate_user!
  def new
    @program = Program.new
  end
end
