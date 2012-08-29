ConcursoLiterario::Application.routes.draw do

  resources :courses do
    resource :presentations
  end

  devise_for :users

  namespace :admin do
    resources :courses do
      resources :rate_types
      resources :presentations do
        resources :rates
      end
    end
    resources :users
  end

  root :to => 'welcome#index'

end
