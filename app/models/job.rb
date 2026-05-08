class Job < ApplicationRecord
  belongs_to :recruiter
  has_many :job_applications, dependent: :destroy
  has_many :job_seekers, through: :job_applications
  scope :latest, ->(n) { order(created_at: :desc).limit(n) }
end
