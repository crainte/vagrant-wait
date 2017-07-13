module VagrantPlugins
    module Wait
        class Provisioner < Vagrant.plugin('2', :provisioner)
            def provision
                sleep config.duration
            end
        end
    end
end
