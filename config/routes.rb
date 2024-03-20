Rails.application.routes.draw do
  devise_for :developers
  namespace :admin do
    get 'welcome/index'
    resources :budgets
    resources :budget_pdf, only: [:show]
    resources :developers, only: [:index, :edit, :update, :destroy]
  end

  root 'admin/welcome#index'
end
