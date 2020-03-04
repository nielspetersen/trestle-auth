module Trestle
  module Auth
    module Backends
      require_relative "backends/base"
      require_relative "backends/basic"
      require_relative "backends/warden"
      require_relative "backends/devise"

      def self.lookup(backend)
        case backend
        when Class
          backend
        else
          registry.fetch(backend) { raise ArgumentError, "Invalid authentication backend: #{backend.inspect}" }
        end
      end

      def self.registry
        @registry ||= {}
      end

      def self.register(name, klass)
        registry[name] = klass
      end

      register(:basic, Basic)
      register(:devise, Devise)
      register(:warden, Warden)
    end
  end
end
