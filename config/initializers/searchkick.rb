# Configure Searchkick options for timeout
if defined?(Searchkick)
  Searchkick.client_options = {
    retry_on_failure: true,
    transport_options: {
      request: {
        timeout: 5, # seconds
        open_timeout: 1
      }
    }
  }
end 