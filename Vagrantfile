Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/bionic64"
    config.vm.define "ansible-server" do |server|
        server.vm.provision "Enable ssh connection with passwd", type: "shell", path: "enable_ssh_password_auth.sh"
        server.vm.provision "Install python3", type: "shell", privileged: true, inline: "apt-get update && apt-get install -y python3 python3-pip python3-venv"
        server.vm.provision "Install docker", type: "shell", inline: "curl -fsSL https://get.docker.com/ | sudo sh"
        server.vm.provision "Install kubectl", type: "shell", path: "install_kubectl.sh"
        server.vm.provision "Move kubectl to /usr/local/bin/", type: "shell", privileged: true, inline: "mv ./kubectl /usr/local/bin/kubectl"
        server.vm.provision "Install kubespray", type: "shell", inline: "git clone https://github.com/kubernetes-sigs/kubespray.git"
        server.vm.provision "Chown kubespray", type: "shell", privileged: true, inline: "chown -R vagrant:vagrant kubespray"
        server.vm.provision "Declare IPS for cluster", type: "shell", path: "declare_ips.sh"
        server.vm.provision "Activate virtualenv", type: "shell", inline: "python3 -m venv .env && source .env/bin/activate"
        server.vm.provision "Install dependencies from requirements.txt", type: "shell", inline: "cd kubespray && pip3 install -r requirements.txt"
        server.vm.provision "Copy inventory/sample as inventory/mycluster", type: "shell", privileged: true, inline: "cp -rfp inventory/sample inventory/mycluster"
        server.vm.provider "virtualbox" do |vb|
            vb.name = "ansible-server"
            vb.memory = 4096
            vb.cpus = 2
        end
        server.vm.host_name = "ansible-server"
        server.vm.network "public_network", ip: "192.168.0.10"
    end

    (2..4).each do |i|
      config.vm.box = "ubuntu/bionic64"
      config.vm.define "ansible-client00#{i}" do |cfg|
          cfg.vm.provision "shell" do |sh|
            sh.path = "enable_ssh_password_auth.sh"
          end
          cfg.vm.provision "install python", type: "shell", privileged: true, inline: "apt-get update && apt-get install -y python"
          cfg.vm.provision "Install docker", type: "shell", inline: "curl -fsSL https://get.docker.com/ | sudo sh"
          cfg.vm.provider "virtualbox" do |vb|
              vb.name = "ansible-client00#{i}"
              vb.memory = 1500
              vb.cpus = 1
          end
          cfg.vm.host_name = "ansible-client00#{i}"
          cfg.vm.network "public_network", ip: "192.168.0.#{i}"
      end
    end
end
