Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register',
    }

  namespace :api do
    get '/tag_suggestions/:type', to: 'tag_suggestions#show', as: :tag_suggestions
  end
  
  get '/edit/:id', to: 'editor#edit', as: :editor
  patch '/edit/:id', to: 'editor#update'
  
  EditorController::EDITOR_PAGES.each do |page|
    get "/edit/:id/#{page}", to: "editor#edit_#{page}", 
      as: :"#{page}_editor"
  end

  get '/users', to: 'users#index', as: :users
  get '/@:id', to: 'users#show', as: :user

  get '/settings', to: 'settings#edit', as: :settings
  patch '/settings', to: 'settings#update'

  get '/new', to: 'subjects#new', as: :new_subject 
  post '/new', to: 'subjects#create'
  get '/:id', to: 'subjects#show', as: :subject

  root to: 'subjects#index'
end
