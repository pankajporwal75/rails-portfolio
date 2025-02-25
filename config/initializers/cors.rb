Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # Change '*' to your frontend domain for security (e.g., 'https://yourfrontend.com')

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
