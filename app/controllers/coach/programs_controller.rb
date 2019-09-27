class Coach::ProgramsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @program= Program.all.page(params[:page]).per(5)
  end

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

  def edit
    @program = Program.find(params[:id])
    if @program.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @program = Program.find(params[:id])

    if @program.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @program.update_attributes(program_params)
    if @program.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
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
    params.require(:program).permit(:title, :description, :cost, :tag_text, :start_date, :end_date, :meet_times, :address, :image)
  end

end

