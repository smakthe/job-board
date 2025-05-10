module Dashboard
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    
    def index
      if current_recruiter
        @jobs = current_recruiter.jobs
      elsif current_job_seeker
        @applications = current_job_seeker.job_applications
      else
        redirect_to root_path
      end
    end
    
    private
    
    def authenticate_user!
      unless current_recruiter || current_job_seeker
        redirect_to new_job_seeker_session_path
      end
    end
  end
end 