Rails.application.routes.draw do
  devise_for :users , :controllers => {registrations: 'registrations'}
  resources :articles do
    collection do
      get :display
      get :published_article
    end 
   end 
  resources :categories
  root to: 'welcome#index'
end

