BloggingApp::Application.routes.draw do
  devise_for :users
  resources :articles

  root to: "welcome#index"
end
