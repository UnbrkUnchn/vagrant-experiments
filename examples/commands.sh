# Шпаргалка. Это не скрипт — копируй команды по одной из корня репо.

vagrant --version
vagrant help
vagrant validate              # проверить Vagrantfile без запуска VM

# Vagrantfile с нуля (у нас он уже есть)
# vagrant init bento/ubuntu-26.04
# Все варианты оформления: examples/Vagrantfile.example (не для vagrant up)

# --- жизнь VM ---
vagrant up                    # создать/включить; provision только при ПЕРВОМ создании
vagrant up --provision        # живая VM: снова прогнать скрипты
vagrant up --no-provision     # включить, без скриптов
vagrant provision             # то же, что up --provision, без перезагрузки
vagrant provision --provision-with prepare   # только apt update
vagrant provision --provision-with stack     # пакеты + блог
vagrant reload                # перезагрузка (как reboot)
vagrant reload --provision    # reboot + снова provision
vagrant ssh                   # шелл внутрь (пользователь vagrant)
vagrant ssh -c 'uptime'       # одна команда без интерактива
vagrant ssh-config            # HostName/Port/IdentityFile — удобно для ssh/scp
vagrant port                  # какие порты проброшены
vagrant status
vagrant global-status         # все VM на этой машине, не только этот каталог
vagrant halt                  # выключить, диск сохранить
vagrant suspend               # сон (быстрее halt, диск+RAM)
vagrant resume                # выйти из suspend
vagrant destroy -f            # удалить VM

# --- боксы (образы) ---
vagrant box list
vagrant box outdated
vagrant box update
vagrant box prune             # удалить старые версии боксов из ~/.vagrant.d
# vagrant box remove bento/ubuntu-26.04

# --- отладка ---
# VAGRANT_LOG=debug vagrant up
# VAGRANT_LOG=debug vagrant provision --provision-with stack

# --- снимки (если провайдер умеет) ---
# vagrant snapshot save before-experiment
# vagrant snapshot restore before-experiment
# vagrant snapshot list

# Provision: скрипт можно писать прямо в Vagrantfile (inline), не только path:
#
#   config.vm.provision "shell", inline: <<-SHELL
#     apt-get update
#     apt-get install -y nginx
#   SHELL
#
# У нас вынесено в scripts/*.sh — так проще править длинный стек.
# Короткий apt update спокойно живёт inline.
