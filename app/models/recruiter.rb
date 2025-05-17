class Recruiter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :jobs, dependent: :destroy

  after_create :send_email

  def send_email
  	UserMailer.recruiter_email(self).deliver_now		
  end
end
