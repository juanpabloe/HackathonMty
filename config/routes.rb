HackathonACM::Application.routes.draw do

  resources :teams

  get "welcome/index"

  root :to => 'welcome#index'

end
