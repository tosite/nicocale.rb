# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  root to: "devise/sessions#new"

  devise_for :users
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  get "auth/slack/callback" => "slack#callback"
  get "auth/slack/index"    => "slack#index"

  namespace :admin do
    resources :emotions, only: %i(index new edit create update)
  end

  resources :teams, only: %i(index new show create update destroy) do
    member { post :join }
    resources :user_emotions
    namespace :emotions do
      resources :calendar, only: %i(show)
      resources :list,     only: %i(show)
    end
  end

  get "/api/teams/:team_id/emotions/:emotion_id" => "user_emotions#modify"
end
