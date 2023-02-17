Rails.application.routes.draw do
  root 'short_urls#index', as: 'short_urls_index'
  get '/new' => 'short_urls#new'
  get 'url/:slug' => 'short_urls#get_original_url'
  post '/short_urls' => 'short_urls#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
