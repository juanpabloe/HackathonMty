HackathonACM::Application.routes.draw do

  resources :members

  resources :teams

  get "welcome/index"

  root :to => 'welcome#index'

end
