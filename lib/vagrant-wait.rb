begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant Wait plugin must be run within Vagrant."
end

require "log4r"

# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.2.0"
  raise "The Vagrant Wait plugin is only compatible with Vagrant 1.2+"
end

module VagrantPlugins
  module Wait

    VERSION = "0.0.3"

    class Plugin < Vagrant.plugin("2")
      name "Wait"
      description <<-DESC
      The wait plugin allows a wait to be performed as a provisioning step.
      DESC

      provisioner "wait" do
        class WaitProvisioner < Vagrant.plugin("2", :provisioner)

          def initialize(machine, config)
            super
          end

          def configure(root_config)
          end

          def provision
            sleep 300
          end

          def cleanup
          end

        end
        WaitProvisioner

      end
    end
  end
end

