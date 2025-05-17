FROM ruby:2.6.3

# Install yarn, Node.js and PostgreSQL client
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get update -qq && \
    apt-get install -y nodejs postgresql-client && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Extract bundler version from Gemfile.lock and install it
RUN export BUNDLER_VERSION=$(cat Gemfile.lock | grep -A 1 "BUNDLED WITH" | tail -n 1 | tr -d ' ') && \
    gem install bundler:"$BUNDLER_VERSION" && \
    bundle config set force_ruby_platform true && \
    bundle install

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install JavaScript dependencies
RUN yarn install

# Copy the rest of the application
COPY . /app/

# Create directories for temporary files and logs
RUN mkdir -p tmp/pids tmp/sockets log

# Add entrypoint script
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]