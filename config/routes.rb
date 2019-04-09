Rails.application.routes.draw do
  get 'allocations/show'
  resources :scores
  resources :forms
  resources :events

  mount LetsEncrypt::Engine => '/.well-known'

  get '/year/:year_group/forms', to: 'forms#year_forms'
  get '/events/:event_id/year_group/:year_group/record', to: 'records#scoped_records'
  get '/events/:event_id/year_group/:year_group/current_record', to: 'records#current_record'
  post '/events/:event_id/year_group/:year_group/record', to: 'records#update_record'

  get '/events/:event_id/year_group/:year_group/competitor/:competitor', to: 'allocations#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
