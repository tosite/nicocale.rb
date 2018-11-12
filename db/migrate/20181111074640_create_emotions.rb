# frozen_string_literal: true

class CreateEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :emotions do |t|
      t.integer :score
      t.string  :name

      t.timestamps
    end
  end
end
