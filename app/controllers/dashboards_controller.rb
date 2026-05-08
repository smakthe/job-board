class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    if recruiter_signed_in?
      @jobs = current_recruiter.jobs.includes(:job_applications)
    elsif job_seeker_signed_in?
      @applications = current_job_seeker.job_applications.includes(job: :recruiter)
    else
      redirect_to root_path
    end
  end
end
