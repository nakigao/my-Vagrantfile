Vagrant.configure("2") do |config|
    config.vm.box = "bento/centos-6.9"
    config.vm.network :private_network, ip: "192.168.100.100"
    config.vm.provision :shell, :path => "vagrant_bootstrap.sh"
    config.vm.synced_folder "./", "/var/www/html/" , type: "rsync",
        rsync__exclude: [
            ".git/",
            ".idea/",
            ".vagrant/",
            "memo/",
            "vagrant_bootstrap.sh",
            "Vagrantfile"
        ]
end