# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api', defaults: { format: :json } do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :characters do
      collection do
        post :xp
      end
    end

    scope :scrap, controller: :scrappers do
      post :branches
      post :events
      post :locations

      get :branches
      get :events
      get :locations
    end

    resources :events, only: [:index]
  end
end
