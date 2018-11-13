# frozen_string_literal: true

json.array! @emotions, partial: "emotions/emotion", as: :emotion
