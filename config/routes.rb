Rails.application.routes.draw do
  root 'welcome#index'
  get 'search', to: 'legislators#index'

    resources :legislators, only: [:show], param: :slug do
      resources :committees, only: [:index]
    end
end
