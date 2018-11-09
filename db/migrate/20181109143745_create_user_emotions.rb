# frozen_string_literal: true

class CreateUserEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_emotions do |t|
      t.integer  :emotion_id
      t.integer  :team_user_id
      t.integer  :user_id
      t.integer  :team_id
      t.text     :description
      t.date     :reported_on
      t.timestamps
    end
  end
end
