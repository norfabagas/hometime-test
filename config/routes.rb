Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/api/book', to: 'book#book'
  get '/api/clear', to: 'book#clear'
end
