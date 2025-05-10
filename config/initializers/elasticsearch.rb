# Set a global flag for Elasticsearch availability - defaulting to false initially
ELASTICSEARCH_AVAILABLE = false

# Only try to connect if we're in development or production (not test)
if !Rails.env.test?
  begin
    # Try to connect with a very short timeout
    client = Elasticsearch::Client.new(
      url: 'http://localhost:9200',
      transport_options: { request: { timeout: 1, open_timeout: 1 } }
    )
    
    # Only set to true if ping succeeds
    ELASTICSEARCH_AVAILABLE = client.ping rescue false
    
    if defined?(Rails) && Rails.logger
      if ELASTICSEARCH_AVAILABLE
        Rails.logger.info "Connected to Elasticsearch at localhost:9200"
      else
        Rails.logger.warn "Elasticsearch not available at localhost:9200. Search functionality will be limited."
      end
    end
  rescue => e
    if defined?(Rails) && Rails.logger
      Rails.logger.warn "Failed to connect to Elasticsearch: #{e.message}. Search functionality will be limited."
    end
  end
end

# Simple fallback search for models
module FallbackSearch
  def simple_search(query, fields, limit=100)
    return all.limit(limit) if query.blank?
    
    conditions = fields.map { |field| "#{field} ILIKE ?" }.join(" OR ")
    values = Array.new(fields.size, "%#{query}%")
    
    where(conditions, *values).limit(limit)
  end
end

# Extend ActiveRecord::Base with fallback search
ActiveRecord::Base.extend FallbackSearch 