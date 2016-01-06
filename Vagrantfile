BOX_NAME = ENV["BOX_NAME"] || "bento/ubuntu-14.04"
BOX_MEMORY = ENV["BOX_MEMORY"] || 2048
BOX_IP = ENV["BOX_IP"] || "10.0.0.4"
FORWARDED_PORT = (ENV["FORWARDED_PORT"] || '8081').to_i

Vagrant.configure(2) do |config|
  config.vm.box = BOX_NAME

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    # Ubuntu's Raring 64-bit cloud image is set to a 32-bit Ubuntu OS type by
    # default in Virtualbox and thus will not boot. Manually override that.
    v.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    v.customize ["modifyvm", :id, "--memory", BOX_MEMORY]
  end

  config.vm.define :docker, primary: true do |config|
    config.vm.network :forwarded_port, guest: 80, host: FORWARDED_PORT
    config.vm.network :private_network, ip: BOX_IP
    config.vm.provision "shell", inline: <<-EOF
      set -e

      export DEBIAN_FRONTEND=noninteractive

      echo "en_US.UTF-8 UTF-8" >/etc/locale.gen
      locale-gen
      echo "Apt::Install-Recommends 'false';" >/etc/apt/apt.conf.d/02no-recommends
      echo "Acquire::Languages { 'none' };" >/etc/apt/apt.conf.d/05no-languages
      apt-get update
      apt-get -y remove --purge puppet juju
      apt-get -y autoremove --purge
      apt-get -y install ruby
      wget -qO- https://get.docker.com/ | sh

      cp -r /vagrant /var/intercity
    EOF
  end
end
