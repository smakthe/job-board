class UserMailer < ApplicationMailer
	default from: 'harshitha@progton.com'

	def recruiter_email(user)
		@recruiter_user=user
    mail(to: @recruiter_user.email, subject: 'Welcome to NEWBIZ Site')
  end

  def jobseeker_email(user)
  	@jobseeker_user=user
  	mail(to: @jobseeker_user.email, subject: 'Welcome to NEWBIZ Site')
  end

  def recruiter_apply(job,user)
  	@user=user
  	@job=job
  	mail(to: @job.recruiter.email, subject: " #{@user.name} has applied  " ) 	
  end

  def jobseeker_apply(job,user)
  	@user=user
  	@job=job
  	mail(to: @user.email, subject: " Applied to #{@job.recruiter.cname}  " ) 	
  end  

end
