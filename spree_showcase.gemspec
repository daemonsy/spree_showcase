# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_showcase'
  s.version     = '0.7'
  s.summary     = 'A Simple Spree Slider'
  s.description = 'A simple slider accommodator, using Flexslider as default'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Damon Aw'
  s.email     = 'daemonsy@gmail.com'
  s.homepage  = 'http://damon.theidealweb.com'

  s.files       = `git ls-files`.split("\n")
  # s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 2'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sqlite3'
end
