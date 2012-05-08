module Spree
  module Admin
    class ShowcaseSettingsController < BaseController
     def show
        @preferences = [:enabled, :thumbnail_style, :showcase_style ]
      end
     
      def edit
        @preferences = [:enabled, :thumbnail_style, :showcase_style]
      end
     
      def update
        params.each do |name, value|
          next unless SpreeShowcase::Config.has_preference? name
          SpreeShowcase::Config[name] = value
        end
     
        redirect_to admin_showcase_settings_path
      end
    end
  end
end