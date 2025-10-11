FROM ruby:3.2.1 AS base

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  postgresql-client \
  nodejs \
  yarn \
  libvips42 \
  libvips-dev \
  libimage-exiftool-perl \
  imagemagick \
  poppler-utils \
  libpoppler-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install bundler
RUN gem install bundler

# Copy Gemfile separately for caching
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

# Copy rest of the app
COPY . .

# Precompile assets
ENV RAILS_ENV=production
ENV RACK_ENV=production
RUN bundle exec rails assets:precompile

# Expose port
EXPOSE 3000

# Run using Puma (configured in config/puma.rb)
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
