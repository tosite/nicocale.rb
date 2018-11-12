# frozen_string_literal: true

class Emotion < ApplicationRecord
  has_many         :user_emotions
  has_one_attached :avatar
end
