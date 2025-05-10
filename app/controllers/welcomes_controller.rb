class WelcomesController < ApplicationController
  def index
  	if current_user
  		redirect_to :controller => 'dashboard/dashboard', :action => 'index' 
  	end
  end

  def register
  end
end
