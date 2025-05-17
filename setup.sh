#!/bin/bash
set -e

# Create a simple .env.production file if it doesn't exist
if [ ! -f .env.production ]; then
  echo "Creating .env.production file..."
  echo "DATABASE_HOST=db" > .env.production
  echo "DATABASE_USERNAME=postgres" >> .env.production
  echo "DATABASE_PASSWORD=1234" >> .env.production
fi

echo "🏗️  Building Docker images..."
docker-compose build

echo "🚀 Starting PostgreSQL service..."
docker-compose up -d db

echo "⏳ Waiting for PostgreSQL to be ready..."
docker-compose run --rm web bash -c "until pg_isready -h db -U postgres; do echo 'Waiting for PostgreSQL...'; sleep 2; done"

echo "🗄️  Creating database..."
docker-compose run --rm web bundle exec rails db:create

echo "🔄 Running migrations..."
docker-compose run --rm web bundle exec rails db:migrate

echo "✅ Setup complete! You can now start the application with:"
echo "docker-compose up"