class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @reports = report.all
  end
end
