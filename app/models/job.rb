class Job < ApplicationRecord
  belongs_to :recruiter
  has_many :job_applications, dependent: :destroy
  has_many :job_seekers, through: :job_applications

  # Add searchkick with error handling
  if defined?(ELASTICSEARCH_AVAILABLE) && ELASTICSEARCH_AVAILABLE
    searchkick text_middle: [:title], callbacks: false
  end
  
  # Fallback search method when Elasticsearch is not available
  def self.search_by_title(query)
    simple_search(query, [:title])
  end
end 