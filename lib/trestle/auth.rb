require "trestle/auth/version"

require "trestle"

module Trestle
  module Auth
    extend ActiveSupport::Autoload

    autoload :Admin
    autoload :AccessDenied
    autoload :Backends
    autoload :Builder
    autoload :Configuration
    autoload :Constraint
    autoload :ControllerMethods
    autoload :ModelMethods
    autoload :NullUser
    autoload :Resource

    module Controller
      extend ActiveSupport::Autoload

      autoload :Authentication
      autoload :Authorization
      autoload :Locale
      autoload :TimeZone
    end

    autoload_under "adapters" do
      autoload :CanCanAdapter
    end
  end

  Configuration.option :auth, Auth::Configuration.new
end

require "trestle/auth/engine" if defined?(Rails)
