class ReindexJob < ApplicationJob
  queue_as :default
  discard_on StandardError

  def perform(class_name, id)
    begin
      # Find the record
      record = class_name.constantize.find_by(id: id)
      
      # Only reindex if record exists and Elasticsearch is available
      if record.present?
        client = Elasticsearch::Client.new url: 'http://localhost:9200'
        if client.ping
          record.reindex(refresh: false)
          Rails.logger.info "Successfully reindexed #{class_name} with ID #{id}"
        else
          Rails.logger.warn "Elasticsearch unavailable, skipping reindex of #{class_name} with ID #{id}"
        end
      end
    rescue => e
      Rails.logger.error "Error reindexing #{class_name} with ID #{id}: #{e.message}"
      # Don't raise the error to prevent retries
    end
  end
end 