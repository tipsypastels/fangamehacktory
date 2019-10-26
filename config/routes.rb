Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register',
    }

  scope '/topic_admin/:id', as: :topic_admin do 
    patch '/pin', to: 'topic_admin#pin', as: :pin
    patch '/unpin', to: 'topic_admin#unpin', as: :unpin
  end
  
  get '/edit/:id', to: 'editor#edit', as: :editor
  patch '/edit/:id', to: 'editor#update'
  
  EditorController::EDITOR_PAGES.each do |page|
    get "/edit/:id/#{page}", to: "editor#edit_#{page}", as: :"edit_#{page}"
  end


  get '/users', to: 'users#index', as: :users
  get '/@:id', to: 'users#show', as: :user

  get '/settings', to: 'settings#edit', as: :settings
  patch '/settings', to: 'settings#update'

  get '/new', to: 'topics#new', as: :new_topic 
  post '/new', to: 'topics#create'
  get '/:id', to: 'topics#show', as: :topic


  root to: 'topics#index'
end
