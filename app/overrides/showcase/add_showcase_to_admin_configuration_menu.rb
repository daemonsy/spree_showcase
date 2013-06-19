Deface::Override.new(:virtual_path => 'spree/admin/configurations/index',
                     :name => 'add_showcase_to_admin_configurations_menu',
                     :insert_bottom => "[data-hook='admin_configurations_menu']",
                     :text => %q{
                        <tr>
                          <td><%= link_to Spree.t(:showcase_slider), admin_slides_path %></td>
                          <td><%= Spree.t(:showcase_settings) %></td>
                        </tr> })

