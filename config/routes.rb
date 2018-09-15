Rails.application.routes.draw do
  namespace :admin do
    get 'welcome/index'
    resources :budgets
    resources :budget_pdf, only: [:show]
  end

  root 'admin/welcome#index'
end
