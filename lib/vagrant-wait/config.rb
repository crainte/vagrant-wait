module VagrantPlugins
    module Wait
        class Config < Vagrant.plugin('2', :config)
            attr_accessor :duration

            def initialize
                @duration = UNSET_VALUE
            end

            def finalize!
                @duration = 300 if @duration == UNSET_VALUE
            end

            def validate(machine)
                errors = _detected_errors

                unless duration.is_a?(Integer)
                    errors << ':wait provisioner requires duration to be an integer'
                end

                { 'wait provisioner' => errors }
            end
        end
    end
end
