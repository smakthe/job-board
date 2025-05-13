class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :apply]
  before_action :authenticate_job_seeker!, only: [:apply]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.recruiter = current_recruiter

    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_url, notice: 'Job was successfully destroyed.'
  end

  def apply
    if request.patch?
      application = JobApplication.new(job: @job, job_seeker: current_job_seeker)
      
      if application.save
        redirect_to @job, notice: 'You have successfully applied for this job.'
      else
        redirect_to @job, alert: 'Unable to apply for this job.'
      end
    else
      # For GET requests, just redirect to the job page
      redirect_to @job
    end
  end

  private
  
  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :salary, :experience, :job_location,)
  end
end 