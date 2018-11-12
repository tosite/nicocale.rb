# frozen_string_literal: true

class TeamUser < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many   :user_emotions
  validate   :exist_team_id
  validate   :exist_user_id

  scope :team_id, -> (team_id) { where(team_id: team_id) }
  scope :user_id, -> (user_id) { where(user_id: user_id) }

  def self.joined?(team_id: team_id, user_id: user_id)
    team_id(team_id).user_id(user_id).exists?
  end

  private
    def exist_team_id
      errors.add(:team_id, "team_idが存在しません。") if Team.all.ids.exclude?(team_id)
    end
    def exist_user_id
      errors.add(:user_id, "user_idが存在しません。") if User.all.ids.exclude?(user_id)
    end
end
