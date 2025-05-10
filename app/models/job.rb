class Job < ApplicationRecord
	belongs_to :recruiter
	has_many :job_applications, dependent: :destroy
	has_many :job_seekers, through: :job_applications

	searchkick text_middle: [:title]
end
