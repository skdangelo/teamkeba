class Coach::ProgramsController < ApplicationController
  before_action :authenticate_user!
  def new
    @program = Program.new
  end

  def create
    @program = current_user.programs.create(program_params)
    if @program.valid?
      redirect_to coach_program_path(@program)
    else
      render :new, status: :unprocessable_entity
    end    
    
  end

  def show
    @program = Program.find(params[:id])
  end

  private

  def program_params
    params.require(:program).permit(:title, :description, :cost)
  end

end

