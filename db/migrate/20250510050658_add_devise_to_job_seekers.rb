# frozen_string_literal: true

class AddDeviseToJobSeekers < ActiveRecord::Migration[6.0]
  def self.up
    change_table :job_seekers do |t|
      ## Database authenticatable
      unless column_exists?(:job_seekers, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      ## Recoverable
      unless column_exists?(:job_seekers, :reset_password_token)
        t.string   :reset_password_token
      end
      
      unless column_exists?(:job_seekers, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      ## Rememberable
      unless column_exists?(:job_seekers, :remember_created_at)
        t.datetime :remember_created_at
      end

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Fields name and resume are already defined in the CreateJobSeekers migration
    end

    unless index_exists?(:job_seekers, :email, unique: true)
      add_index :job_seekers, :email, unique: true
    end
    
    unless index_exists?(:job_seekers, :reset_password_token, unique: true)
      add_index :job_seekers, :reset_password_token, unique: true
    end
    # add_index :job_seekers, :confirmation_token,   unique: true
    # add_index :job_seekers, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    change_table :job_seekers do |t|
      if column_exists?(:job_seekers, :encrypted_password)
        t.remove :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
      end
    end
    
    if index_exists?(:job_seekers, :email, unique: true)
      remove_index :job_seekers, :email
    end
    
    if index_exists?(:job_seekers, :reset_password_token, unique: true)
      remove_index :job_seekers, :reset_password_token
    end
  end
end
