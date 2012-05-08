
class Spree::ShowcaseConfiguration < Spree::Preferences::Configuration
  preference :enabled, :boolean, :default => true
  preference :thumbnail_style, :string, :default=>"220x110#"
  preference :showcase_style, :string, :default =>"940x470#"
end

