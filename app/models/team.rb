# frozen_string_literal: true

class Team < ApplicationRecord
  has_one_attached :avatar
  validates :name,
    presence: true,
    length: { maximum: 20 }
  has_many :team_users, dependent: :destroy

  def team_user(user_id:)
    self.team_users.where(user_id: user_id)
  end
end
