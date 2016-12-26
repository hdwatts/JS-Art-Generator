Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/index', to: 'application#index'
  post '/upload', to: 'upload#index'
  post '/getcolor', to: 'upload#color'
end
