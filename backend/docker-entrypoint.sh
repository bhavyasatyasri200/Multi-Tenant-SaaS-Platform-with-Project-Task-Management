#!/bin/sh
set -e

echo "⏳ Waiting for Postgres..."
until nc -z database 5432; do
  echo "Postgres starting..."
  sleep 1
done

echo "🔄 Running migrations..."
npm run migrate

echo "🌱 Running seeds..."
npm run seed

echo "🚀 Starting server..."
exec npm start
