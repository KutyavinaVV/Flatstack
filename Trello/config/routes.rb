# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#show'
  resources :lists do
    resources :tasks
  end
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
