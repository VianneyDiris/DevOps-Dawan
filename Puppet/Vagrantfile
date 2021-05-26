class VagrantPlugins::ProviderVirtualBox::Action::Network

  def dhcp_server_matches_config?(dhcp_server, config)

    true
  end
end

Vagrant.configure("2") do |config|
  [
    ["ppmaster.formation.lan", "2048", 'ubuntu/focal64' ],
    ["cli01.formation.lan", "1024", 'debian/buster64' ],
    ["cli02.formation.lan", "1024", 'centos/8' ],
  ].each do |vmname,mem,os|
    config.vm.define "#{vmname}" do |machine|

      machine.vm.provider "virtualbox" do |v|
        v.memory = "#{mem}"
        v.cpus = 1
        v.name = "#{vmname}"
      end

      machine.vm.box = "#{os}"
      machine.vm.hostname = "#{vmname}"
      machine.vm.network "private_network", type: "dhcp"
    end
  end
end
