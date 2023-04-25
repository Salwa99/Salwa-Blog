Rails.application.routes.draw do
root 'users#index'
get '/user/:user_id', to: 'users#show_user'
get '/user/:user_id/post', to: 'posts#index'
get '/user/:user_id/post/:post_id', to: 'posts#show_post'
end
