# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development? # 開発環境の場合
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
