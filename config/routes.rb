Rails.application.routes.draw do
  namespace :api, path: '', contraints: {subdomain: 'api'} do
    namespace :v1 do
      resources :coffees
      get 'search', to: 'coffees#search'
    end
  end
end
