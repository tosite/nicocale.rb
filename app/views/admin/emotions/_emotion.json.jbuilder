# frozen_string_literal: true

json.extract! emotion, :id, :score, :name, :created_at, :updated_at
json.url emotion_url(emotion, format: :json)
