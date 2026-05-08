class JobsController < ApplicationController
  before_action :set_job, only: [ :show, :edit, :update, :destroy, :apply ]
  before_action :authenticate_job_seeker!, only: [ :apply ]
  before_action :authenticate_recruiter!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :authorize_recruiter!, only: [ :edit, :update, :destroy ]

  def index
    @jobs = Job.includes(:recruiter).all
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
      redirect_to @job, notice: "Job was successfully created."
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: "Job was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_url, notice: "Job was successfully destroyed."
  end

  def apply
    if JobApplication.exists?(job: @job, job_seeker: current_job_seeker)
      redirect_to @job, alert: "You have already applied for this position."
    else
      application = JobApplication.new(job: @job, job_seeker: current_job_seeker)

      if application.save
        redirect_to @job, notice: "You have successfully applied for this job."
      else
        redirect_to @job, alert: "Unable to apply for this job."
      end
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def authorize_recruiter!
    unless @job.recruiter == current_recruiter
      redirect_to jobs_path, alert: "You are not authorized to perform this action."
    end
  end

  def job_params
    params.expect(job: [ :title, :description, :salary, :experience, :job_location ])
  end
end
