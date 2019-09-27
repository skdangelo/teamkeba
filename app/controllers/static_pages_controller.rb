class StaticPagesController < ApplicationController
  def index
    @programs = Program.all
  end

  def calendar
  end  

  def aboutus
  end  

  def contactus
  end    

  def paperwork
  end    
end
