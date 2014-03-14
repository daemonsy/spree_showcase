module SpreeShowcase
  class Engine < Rails::Engine
    engine_name 'spree_showcase'

    config.autoload_paths += %W(#{config.root}/lib)

    # This initializer creates an instance class that persists throughout the app?

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc

    initializer "spree.showcase.preferences", :before => :load_config_initializers do |app|
      SpreeShowcase::Config = Spree::ShowcaseConfiguration.new
    end
  end
end
