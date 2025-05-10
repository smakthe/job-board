namespace :searchkick do
  desc "Reindex searchable models with error handling"
  task reindex: :environment do
    models = [Recruiter, Job]
    
    puts "Checking Elasticsearch connection..."
    begin
      client = Elasticsearch::Client.new url: 'http://localhost:9200'
      if client.ping
        puts "Elasticsearch is running! Starting reindex..."
        
        models.each do |model|
          puts "Reindexing #{model.name}..."
          begin
            model.reindex
            puts "✅ #{model.name} successfully reindexed"
          rescue => e
            puts "❌ Error reindexing #{model.name}: #{e.class} - #{e.message}"
          end
        end
        
        puts "Reindexing complete!"
      else
        puts "Elasticsearch is not responding. Please make sure Elasticsearch is running on localhost:9200"
      end
    rescue => e
      puts "Failed to connect to Elasticsearch: #{e.class} - #{e.message}"
      puts "Please make sure Elasticsearch is installed and running on localhost:9200"
    end
  end
end 