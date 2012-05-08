Deface::Override.new(
  :virtual_path => 'spree/home/index',
  :name => 'add_spree_slider_to_home_index',
  :insert_before => "code[erb-silent]:contains('content_for :sidebar')",
  :partial => "spree/slides/content_insert"
)
