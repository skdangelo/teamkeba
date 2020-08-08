class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reports = Report.all
  end

  def new
    @greports = Report.new
  end  
end
