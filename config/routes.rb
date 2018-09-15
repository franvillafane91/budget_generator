Rails.application.routes.draw do
  namespace :admin do
    get 'welcome/index'
    resources :budgets, except: [:show]
  end

  root 'admin/welcome#index'
end
