module SpreeShowcase
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../assets", __FILE__)

      def add_javascripts
        puts %q{Copying JS assets into your app's javascripts/store directory. The file showcase.js is required by the extension and is used to activate slideshow.'}
        copy_file "aw-showcase.js", "app/assets/javascripts/store/showcase.js"

        append_file 'app/assets/javascripts/store/all.js', "//= require store/spree_showcase\n"

      end

      def add_stylesheets
        puts %q{showcase.css styles are required by the extension and can be changed in anyway to fit your own _showcase.html.erb}
        copy_file "aw-showcase.css", "app/assets/stylesheets/store/showcase.css"
        inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/spree_showcase\n", :before => /\*\//, :verbose => true
      end
      
      def add_partials
        puts %q{This partial is the template structure for displaying the slideshow.}
        copy_file "aw-slider.html.erb", "app/views/spree/slides/_showcase.html.erb"      
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_showcase'
      end

      def run_migrations
         res = ask 'Would you like to run the migrations now? [Y/n]'
         if res == '' || res.downcase == 'y'
           run 'bundle exec rake db:migrate'
         else
           puts 'Skiping rake db:migrate, don\'t forget to run it!'
         end
      end
      
      def complete
        puts %q{Everything is done! To summarize, _showcase.html.erb => HTML template, showcase.css & showcase.js => assets }
      end
    end
  end
end
