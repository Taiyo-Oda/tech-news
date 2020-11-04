Rails.application.routes.draw do
  root 'links#index'
  get 'links/index'

  resources :links, only: [:index] do
    collection do
      get "page2", to: 'links#page2'
      get "page3", to: 'links#page3'
      get "page4", to: 'links#page4'
      get "page5", to: 'links#page5'
      get "page6", to: 'links#page6'
    end
  end

end
