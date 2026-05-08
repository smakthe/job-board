class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :job_seeker

  validates :job_id, :job_seeker_id, presence: true
  validates :job_id, uniqueness: { scope: :job_seeker_id }

  after_create_commit :notify_users

  private

  def notify_users
    UserMailer.notify_recruiter(job, job_seeker).deliver_later
    UserMailer.notify_jobseeker(job, job_seeker).deliver_later
  end
end
