module FormVerification
  class Railtie < Rails::Railtie
    initializer 'add javascript vendor path to assets pipeline' do |app|
      app.config.assets.paths << File.expand_path(
        "../../../vendor/assets/javascripts",
        __FILE__
      )
    end

    initializer 'add form helper' do
      ActiveSupport.on_load(:action_view) do
        ActionView::Helpers::FormBuilder.send(:include, FormVerification::FormBuilder)
      end
    end

    initializer 'add controller helper' do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, FormVerification::Controller)
      end
    end
  end
end
