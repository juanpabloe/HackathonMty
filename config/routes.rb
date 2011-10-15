HackathonACM::Application.routes.draw do

  devise_for :members

  resources :members

  resources :teams do
    collection do
      get 'ratings'
    end
  end

  get "welcome/index"

  root :to => 'welcome#index'

end
