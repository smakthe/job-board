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
  
  # Add searchkick with error handling
  if defined?(ELASTICSEARCH_AVAILABLE) && ELASTICSEARCH_AVAILABLE
    searchkick text_middle: [:cname, :clocation], callbacks: false
  end
  
  # Fallback search method when Elasticsearch is not available
  def self.search_by_company(query)
    simple_search(query, [:company_name, :email])
  end
end
