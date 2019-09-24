class Coach::ProgramsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
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

  def destroy
    @program = Program.find(params[:id])
    if @program.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @program.destroy
    redirect_to root_path
  end  

  def show
    @program = Program.find(params[:id])
  end

  private

  helper_method :current_program
  def current_program
    @current_program ||= Program.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:title, :description, :cost)
  end

end

