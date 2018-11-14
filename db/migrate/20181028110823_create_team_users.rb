# frozen_string_literal: true

class CreateTeamUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_users do |t|
      t.integer :user_id, null: false, index: true
      t.integer :team_id, null: false, index: true

      t.timestamps
    end
  end
end
