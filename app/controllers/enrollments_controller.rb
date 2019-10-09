class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_program.premium?
       # # Amount in cents
       # @amount = (current_program.cost * 100).to_i
       #  customer = Stripe::Customer.create(
       #   email: params[:stripeEmail],
       #   source: params[:stripeToken]
       # )

       # charge = Stripe::Charge.create(
       #   customer: customer.id,
       #   amount: @amount,
       #   description: 'Flixter Premo Content',
       #   currency: 'usd'
       # )
      @enrollment = Enrollment.new(enrollment_params)
      if @registration.save
        redirect_to @enrollment.paypal_url(enrollment_path(@enrollment))
      else
        render :new
      end    
    end

    current_user.enrollments.create(program: current_program)
    redirect_to course_path(current_program)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
  end

  private

  def current_program
    @current_program ||= Program.find(params[:program_id])
  end  


  protect_from_forgery except: [:hook]
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @enrollment = Enrollment.find params[:invoice]
      @enrollment.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end
end
