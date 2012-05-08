
class Spree::ShowcaseConfiguration < Spree::Preferences::Configuration
  preference :enabled, :boolean, :default => true
  preference :js_snippet, :text, :default=>nil
  preference :thumbnail_styles, :string, :default=>"220x110#"
end

