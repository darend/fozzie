require 'fozzie/rails/engine'
require 'fozzie/configuration'

class FozzieRailtie < Rails::Railtie
  initializer "fozzie_railtie.configure_rails_initialization" do |app|

    # Load up the middleware
    app.middleware.use Fozzie::Rails::Middleware if Fozzie::config.enable_rails_middleware

    # Add the Mill route
    app.routes.prepend do
      mount Fozzie::Rails::Engine => '/mill'
    end

  end
end