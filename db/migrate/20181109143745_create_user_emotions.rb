# frozen_string_literal: true

class CreateUserEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_emotions do |t|
      t.integer  :emotion_id,   null: false, index: true
      t.integer  :team_user_id, null: false, index: true
      t.integer  :user_id,      null: false, index: true
      t.integer  :team_id,      null: false, index: true
      t.text     :description,  null: true
      t.date     :reported_on,  null: false, index: true
      t.timestamps
    end
  end
end
