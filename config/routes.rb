Rails.application.routes.draw do
  devise_for :developers
  namespace :admin do
    get 'welcome/index'
    resources :budgets
    resources :budget_pdf, only: [:show]
    resources :developers
  end

  root 'admin/welcome#index'
end
