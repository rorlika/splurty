Splurty::Application.routes.draw do
  root 'quotes#index'

  resources :quotes
end
