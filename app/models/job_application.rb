class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :job_seeker
end
