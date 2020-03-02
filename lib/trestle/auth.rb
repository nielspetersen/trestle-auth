require "trestle/auth/version"

require "trestle"

module Trestle
  module Auth
    extend ActiveSupport::Autoload

    autoload :AccessDenied
    autoload :Backends
    autoload :Configuration
    autoload :Constraint
    autoload :ControllerMethods
    autoload :ModelMethods
    autoload :NullUser

    module Controller
      extend ActiveSupport::Autoload

      autoload :Authentication
      autoload :Authorization
      autoload :Locale
      autoload :TimeZone
    end

    module Extensions
      extend ActiveSupport::Autoload

      autoload :Admin
      autoload :Form
      autoload :Navigation
      autoload :Resource
      autoload :ResourceCollection
      autoload :ResourceController
      autoload :Toolbars
    end

    autoload_under "adapters" do
      autoload :CanCanAdapter
    end
  end

  Configuration.option :auth, Auth::Configuration.new
end

require "trestle/auth/engine" if defined?(Rails)
