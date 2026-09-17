# Vagrant experiments

Одна Ubuntu VM: PostgreSQL, Node и блог [js-fastify-blog](js-fastify-blog/).

## Запуск

```bash
cd vagrant-experiments
vagrant up
```

Блог: [http://127.0.0.1:8888](http://127.0.0.1:8888) (guest `:8080`).

`vagrant up` гоняет `prepare`, потом `stack`. Последний шаг — `make start`: provision может не «закончиться», пока сервер жив. Это нормально, страница уже должна открываться.

Повторный `up` скрипты не запускает. После правок `scripts/`: `vagrant provision`.

```bash
vagrant ssh
cd /vagrant/js-fastify-blog
```

Шпаргалка: [examples/commands.sh](examples/commands.sh).

## Структура

```
Vagrantfile           VM, память, порт, провижинеры
scripts/prepare.sh    apt update
scripts/provision.sh  стек + make start
js-fastify-blog/      приложение
examples/             учебник Vagrantfile и команды
```
