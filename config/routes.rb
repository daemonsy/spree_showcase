Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :slides do
      collection do
        post :update_positions
      end
    end
  end
  namespace :admin do
    resource :showcase_settings
  end
end

