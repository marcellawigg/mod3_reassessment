Rails.application.routes.draw do
  root 'welcome#index'
  get 'search', to: 'legislators#index'
  get 'legislators/:legislator_slug/committees', to: 'legislators#show', as: 'legislator_committees'
end
