ConcursoLiterario::Application.routes.draw do

  resources :courses do
    resources :rate_types
    resources :presentations do
      resources :rates
    end
  end

  resources :users

  devise_for :users

  root :to => 'welcome#index'

end
