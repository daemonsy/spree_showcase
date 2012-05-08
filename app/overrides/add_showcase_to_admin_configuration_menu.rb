Deface::Override.new(:virtual_path => 'spree/admin/configurations/index',
                     :name => 'add_showcase_to_admin_configurations_menu',
                     :insert_bottom => "[data-hook='admin_configurations_menu']",
                     :text => %q{
                        <tr>
                          <td><%= link_to 'Showcase Slider', admin_slides_path %></td>
                          <td>Showcase Slides & Settings</td>
                        </tr> })

