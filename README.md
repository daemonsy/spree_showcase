Spree Showcase
===========

Spree Showcase is a simple extension that allows you to create the good ol' slideshow. The goal is to create a slideshow extension that makes things easy for the users and programmers. Minimal effort needed.

The secondary objective is to create a slideshow template that allows most types of JS slider to be implemented easily into Spree. 

Currently, this is the first iteration of the slideshow extension at v0.1. Contributors are greatly welcomed =)

**Next to come:**
- Adding sliders to different layout positions
- Enabling more options to be customized in the Admin Menu

Example
=======
Get a clean Spree Installation

rails new spree_demo
cd spree_demo
spree install

gem 'spree_showcase', :git=>"git://github.com/daemonsy/spree_showcase" # Into Gemfile

bundle install
rails g spree_showcase:install

Testing
-------
No tests have been done yet. Use at your own risk! 


Copyright (c) 2012 Damon Aw, released under the New BSD License.
[What is the BSD license anyway?]
