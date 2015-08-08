require "rails"
require "errors_to_flash/action_controller/filters"

module ErrorsToFlash
  class Railtie < Rails::Railtie
    initializer "errors_to_flash.configure_view_controller" do |app|
      ActiveSupport.on_load :action_controller do
        include ActionController::Filters
      end
    end
  end
end