# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  root to: "teams#index"

  devise_for :users
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  resources :teams, only: %i(index new show create update destroy)

  # resources :team_users do
  # resources :teams
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
