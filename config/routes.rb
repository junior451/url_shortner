Rails.application.routes.draw do
  root 'short_urls#index', as: 'short_urls_index'
  get '/new' => 'short_urls#new'
  get 'url/:slug' => 'short_urls#get_original_url'
  get '/latest_urls' => 'short_urls#latest_urls_with_vists'
  post '/short_urls' => 'short_urls#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
