class WelcomesController < ApplicationController
  def index
  	if current_user
  		redirect_to :controller => 'dashboard/dashboard', :action => 'index' 
  	end
  end

  def register
  end
  
  def health
    begin
      # Try to ping Elasticsearch
      client = Elasticsearch::Client.new url: 'http://localhost:9200'
      es_status = client.ping ? "Connected" : "Disconnected"
      es_info = client.info rescue nil
      
      render json: { 
        status: "ok", 
        elasticsearch: es_status,
        elasticsearch_info: es_info
      }
    rescue => e
      render json: { 
        status: "error", 
        message: "Elasticsearch error: #{e.class} - #{e.message}",
        elasticsearch: "Disconnected" 
      }
    end
  end
end
