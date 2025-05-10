class AddRecruiterToJob < ActiveRecord::Migration[6.0]
  def change
    add_reference :jobs, :recruiter, null: false, foreign_key: true
  end
end
