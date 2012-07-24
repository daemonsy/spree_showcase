module SpreeShowcase
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../assets", __FILE__)

      def add_javascripts
        append_file 'app/assets/javascripts/store/all.js', "//= require jquery.flexslider\n"
      end

      def add_stylesheets
        inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/spree_showcase\n", :before => /\*\//, :verbose => true
        if copy_file "stylesheets/store/showcase.css.scss", "app/assets/stylesheets/store/showcase.css.scss"
          puts "Copied showcase.css.scss into app/assets/stylesheets/store/showcase.css.scss\n" 
        else
          puts "[Failed] File copying showcase.css.scss => app/assets/stylesheets/store/showcase.css.scss\n"
        end
        puts "showcase.css styles are required by the extension and can be changed in anyway to fit your own _showcase.html.erb\n"
      end

      def add_partials
        puts %q{This partial is the template structure for displaying the slideshow and also includes the settings for the JavaScript plugin.}
        if copy_file "partials/_showcase.html.erb", "app/views/spree/slides/_showcase.html.erb"
          puts "Copied Partial _showcase.html.erb into app/views/spree/slides/_showcase.html.erb\n"      
        else
          puts "[Failed] File copying _showcase.html.erb => app/views/spree/slides/_showcase.html.erb\n"
        end
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
        puts "\nEverything is done! To summarize, _showcase.html.erb => HTML template, showcase.css.scss & showcase.js.erb => assets. Edit these 3 files to fit run the slideshow."
        puts "\nPlease run rake assets:clean (IMPORTANT) to clear any precompiled assets from fresh install of Spree."
      end
    end
  end
end
