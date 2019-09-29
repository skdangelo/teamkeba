class StaticPagesController < ApplicationController
  def index
    @programs = Program.all
  end

  def calendar
  end  

  def aboutus
  end  

  def paperwork
  end    

  def news
  end    
end
