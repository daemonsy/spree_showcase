# This is an ugly hack.
# I wanted to insert above the first element in home/index, hence meaning it only shows when home index is rendered.
# I can't find a selector that says "select ONLY first element of partial", so I do a insert_before
# So I used a current_page? helper in _showcase.html.erb

Deface::Override.new(
  :virtual_path => 'spree/layouts/spree_application',
  :name => 'add_spree_slider_to_home_index',
  :insert_before => "#wrapper",
  :partial => "spree/slides/showcase.html.erb"
)

