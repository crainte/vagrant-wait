begin
    require 'vagrant'
rescue LoadError
    raise 'The vagrant-wait plugin must be run within Vagrant.'
end

require_relative "version"

module VagrantPlugins
    module Wait
        class Plugin < Vagrant.plugin('2')
            name 'vagrant-wait'
            description <<-DESC
            The wait plugin allows a wait to be performed as a provisioning step.
            DESC

            config(:wait, :provisioner) do
                require_relative 'config'
                Config
            end

            provisioner(:wait) do
                require_relative 'provisioner'
                Provisioner
            end
        end
    end
end
