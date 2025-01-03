Rails.application.config.after_initialize do
  ActiveStorage::Current.url_options = Rails.env.development? ? { host: 'http://localhost:3000' } : {host: 'https://admin.pankajporwal.live'}
end
