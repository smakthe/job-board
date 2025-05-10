class CreateJobSeekers < ActiveRecord::Migration[6.0]
  def change
    create_table :job_seekers do |t|
      t.string :name
      t.string :email
      t.text :resume

      t.timestamps
    end
  end
end 