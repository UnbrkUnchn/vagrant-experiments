#!/usr/bin/env bash
# Второй провижинер (имя: stack): PostgreSQL, Node, сборка и запуск блога.
# Идёт от root. Каталог проекта на VM — /vagrant.
set -e
export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_SUSPEND=1

echo ">>>>> Установка PostgreSQL"
apt-get install -y postgresql-18
ln -sf /usr/lib/postgresql/18/bin/postgres /usr/local/bin/postgres

echo ">>>>> Настраиваем PostgreSQL"
sudo -u postgres createuser -s vagrant 2>/dev/null || true
sudo -u postgres createdb vagrant 2>/dev/null || true
sudo -u postgres psql -c "ALTER USER vagrant WITH PASSWORD 'vagrant';"

echo ">>>>> Установка Node.js 26"
curl -fsSL https://deb.nodesource.com/setup_26.x | bash -
apt-get install -y nodejs
npm install -g pnpm

echo ">>>>> Проверка версий"
postgres -V
psql --version
node -v
npm -v
pnpm -v

echo ">>>>> Поднимаем приложение (install + build + tests + start)"
cd /vagrant/js-fastify-blog
sudo -u vagrant make setup
sudo -u vagrant make prepare-env
sudo -u vagrant make test
# make start держит процесс: provision не закончится, пока сервер жив.
sudo -u vagrant make start

echo ">>>>> Готово. В браузере: http://127.0.0.1:8888"
