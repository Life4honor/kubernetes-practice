Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/bionic64"
    config.vm.define "ansible-server" do |server|
        server.vm.provision "Enable ssh connection with passwd", type: "shell", path: "enable_ssh_password_auth.sh"
        server.vm.provision "install ansible", type: "shell", privileged: true, inline: "apt-get update && apt-get install -y ansible" 
        server.vm.provider "virtualbox" do |vb|
            vb.name = "ansible-server"
        end
        server.vm.host_name = "ansible-server"
        server.vm.network "public_network", ip: "192.168.0.10"
    end

    (1..2).each do |i|
      config.vm.box = "ubuntu/bionic64"
      config.vm.define "ansible-client00#{i}" do |cfg|
          cfg.vm.provision "install python", type: "shell", privileged: true, inline: "apt-get update && apt-get install -y python"
          cfg.vm.provision "shell" do |sh|
            sh.path = "enable_ssh_password_auth.sh"
          end
          cfg.vm.provider "virtualbox" do |vb|
              vb.name = "ansible-client00#{i}"
          end
          cfg.vm.host_name = "ansible-client00#{i}"
          cfg.vm.network "public_network", ip: "192.168.0.#{i}"
      end
    end
end
