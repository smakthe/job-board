class Dashboard::ProfilesController < ApplicationController
  def show
	end

	def edit

		@user=current_user	
	end

	def update
		@user = current_user
		respond_to do |format|
			if @user.update(user_params)
				format.html {redirect_to dashboard_profiles_show_url, notice: 'your profile is updated successfully.' }
			else
				format.html { render :edit }
	    end 
		end
end

private

	def user_params
		if current_user.instance_of?JobSeeker		
			params.require(:job_seeker).permit(:name, :qualification, :skills, :dob, :experience)
		else
			params.require(:recruiter).permit(:cname, :description, :clocation, :csize)
		end
  end	
end
