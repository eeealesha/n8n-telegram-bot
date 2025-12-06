#!/bin/bash

echo "🚀 Deploying n8n-telegram-bot with Jupyter Lab..."

# Обновить код из GitHub
echo "📥 Pulling latest changes from GitHub..."
git pull origin main

# Проверить конфигурацию Docker Compose
echo "🔍 Validating docker-compose.yml..."
docker-compose config

# Остановить и удалить старые контейнеры
echo "🛑 Stopping containers..."
docker-compose down

# Создать директории с правильными правами
echo "📁 Setting up directories..."
mkdir -p n8n
sudo chown -R 1000:1000 n8n
chmod 755 n8n

# Запустить новые контейнеры
echo "🔄 Starting containers..."
docker-compose up -d

# Показать статус
echo "✅ Deployment complete!"
echo "📊 Running containers:"
docker ps

echo "📋 Last 20 lines of n8n logs:"
docker logs n8n | tail -20

echo "📋 Last 20 lines of Jupyter logs:"
docker logs jupyter | tail -20
