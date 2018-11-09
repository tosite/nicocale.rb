# frozen_string_literal: true

json.array! @user_emotions, partial: "user_emotions/user_emotion", as: :user_emotion
