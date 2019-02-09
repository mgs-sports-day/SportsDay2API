Rails.application.routes.draw do
  resources :scores
  resources :forms
  resources :events

  mount LetsEncrypt::Engine => '/.well-known'

  get '/year/:year_group/forms', to: 'forms#year_forms'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
