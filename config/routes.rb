Rails.application.routes.draw do
  root 'welcome#index'
  get 'search', to: 'legislators#index'
end
