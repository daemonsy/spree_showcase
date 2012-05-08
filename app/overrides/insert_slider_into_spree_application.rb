Deface::Override.new(
  :virtual_path => "spree/layouts/spree_application", 
  :name => "add_showcase_yield_into_spree_layout",
  :insert_after => %q{#header[data-hook]},
   :text => %q{
   				<div id='spree-slider' data-hook>
                		<%= yield :spree_showcase %>
              	</div>}
)