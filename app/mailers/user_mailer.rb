class UserMailer < ApplicationMailer
  default from: "scmakra99@gmail.com"

  def recruiter_email(user)
  @recruiter_user=user
  mail(to: @recruiter_user.email, subject: "Welcome to Job Board")
  end

  def jobseeker_email(user)
  @jobseeker_user=user
  mail(to: @jobseeker_user.email, subject: "Welcome to Job Board")
  end

  def notify_recruiter(job, user)
  @user=user
  @job=job
  mail(to: @job.recruiter.email, subject: "#{@user.name} has applied to your posting: #{@job.title}")
  end

  def notify_jobseeker(job, user)
    @user=user
    @job=job
    mail(to: @user.email, subject: "Application Received for job: #{@job.title}")
  end
end
