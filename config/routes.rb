Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # METHODS
      match '/managements' => '/api/v1/managements#managements', via: %i[get post]
      put '/managements/:id/update' => '/api/v1/managements#update', via: [:put]
    end
  end
end
