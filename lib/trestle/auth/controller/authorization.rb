module Trestle
  module Auth
    module Controller
      module Authorization
        extend ActiveSupport::Concern

        included do
          before_action :authorize, if: :authorize?
          helper_method :authorized?
          rescue_from AccessDenied, with: :access_denied!
        end

      protected
        def authorized?(action_name, target)
          !authorize? || admin.authorization_adapter.authorized?(action_name.to_sym, target)
        end

        def authorize
          unless authorized?(action_name, authorization_target)
            raise AccessDenied, action: action_name.to_sym, target: authorization_target
          end
        end

        def authorize?
          defined?(admin) && admin && admin.authorize?
        end

        def access_denied!(exception)
          flash[:error] = {
            title:   t("admin.flash.unauthorized.title", default: "Access Denied!"),
            message: t("admin.flash.unauthorized.message", default: "You are not authorized to access this page.", message: exception.message)
          }

          redirect_to instance_exec(&Trestle.config.auth.redirect_on_access_denied)
        end

        def authorization_target
          nil
        end

        def root_authorization_target
          nil
        end
      end
    end
  end
end
