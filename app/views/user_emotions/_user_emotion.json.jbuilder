# frozen_string_literal: true

json.extract! user_emotion, :id, :emotion_id, :team_user_id, :user_id, :team_id, :comment, :created_at, :updated_at
json.url user_emotion_url(user_emotion, format: :json)
