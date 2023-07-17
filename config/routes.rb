Rails.application.routes.draw do
  resources :adventures
  resources :comments 
#                     only [:create]
  devise_for :users, controllers: {
    sessions: 'user/sessions'}

  root "home#index"
#  get '/adventures', to: 'adventures#index', as: 'adventures' # Route for the adventures page
  get '/signup', to: 'registrations#new', as: 'new_registration' # Route for the sign-up page
#  get '/signin', to: 'sessions#new', as: 'new_user_session' # Route for the sign-in page

post '/new_user_reaction', to: 'reactions#new_user_reaction', as: 'new_user_reaction'
end
