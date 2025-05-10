class JobSeeker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :job_applications
	has_many :jobs, through: :job_applications

	after_create :send_email
	def send_email
		UserMailer.jobseeker_email(self).deliver_now		
	end
end
