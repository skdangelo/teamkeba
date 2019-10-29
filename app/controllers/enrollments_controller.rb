class EnrollmentsController < ApplicationController
  before_action :authenticate_user!


  def index
    @enrollments = Enrollment.all
  end

  def create
    if current_program.premium?
       # Amount in cents
       @amount = (current_program.cost * 100).to_i
       customer = Stripe::Customer.create(
         email: params[:stripeEmail],
         source: params[:stripeToken]
       )

       charge = Stripe::Charge.create(
         customer: customer.id,
         amount: @amount,
         description: 'Team Keba',
         currency: 'usd'
       )
    end

    current_user.enrollments.create(program: current_program)
    redirect_to program_path(current_program)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
    end

  private

  def current_program
    @current_program ||= Program.find(params[:program_id])
  end  
end
