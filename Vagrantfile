# Одна Ubuntu VM: PostgreSQL + Node + блог js-fastify-blog.
# Документация: https://docs.vagrantup.com
#
# Каталог этого репо монтируется в VM как /vagrant (дефолт Vagrant).
# Блог на Mac: http://127.0.0.1:8888  →  guest :8080
#
# Повторный vagrant up скрипты не гоняет. После правок:
#   vagrant provision
#   vagrant provision --provision-with prepare
#   vagrant provision --provision-with stack
#
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-26.04"
  # :auto — arm64 на Apple Silicon, amd64 на x86. Не зашивать "arm64".
  config.vm.box_architecture = :auto

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8888, host_ip: "127.0.0.1"

  config.vm.provision "prepare", type: "shell", path: "scripts/prepare.sh"
  config.vm.provision "stack", type: "shell", path: "scripts/provision.sh"
end
