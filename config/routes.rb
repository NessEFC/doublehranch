Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#index"

  get "/profile/:id", to: "users#show", as: 'user_profile'
  get "/profile/:user_id/edit", to: "users#edit", as: 'edit_user_profile'
  patch "/profile/:user_id/update", to: "users#update", as: 'update_user_profile'
  get "/profiles", to: "users#index", as: 'user_profiles'
  get "/grapevine", to: "users#index", as: 'grapevine'

  get   "/users/:user_id/verify", to: "verification#edit"
  patch "/users/:user_id/verify", to: "verification#update", as: "verification"

  post '/posts/:post_id/comment', to: 'posts#comment', as: 'comment_post'
  get '/posts/hidden', to: 'posts#hidden', as: 'hidden_posts'
  post '/posts/:post_id/hide', to: 'posts#hide', as: 'hide_post'
  post '/posts/:post_id/unhide', to: 'posts#unhide', as: 'unhide_post'
  patch '/posts/:id/tags', to: 'posts#edit_tags', as: 'edit_post_tags'

  get "/users/upload", to: "users#upload", as: "upload_users"
  post "/users/import", to: "users#import"

  get 'tags/:tag', to: 'posts#index', as: :tag

  devise_for :users
  resources :posts do
    get :autocomplete_tag_name, :on => :collection
  end
  resources :comments, only: [:update, :destroy]
  resources :email_templates
  resources :announcements

end
