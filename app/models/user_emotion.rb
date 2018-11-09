# frozen_string_literal: true

class UserEmotion < ApplicationRecord
  belongs_to :team_user
  belongs_to :user
  belongs_to :team
  validate   :exist_team_user_id
  validate   :exist_team_id
  validate   :exist_user_id
  validates  :reported_on, presence: true
  validates  :description, length: { maximum: 200 }
  private
    def exist_team_user_id
      errors.add(:team_user_id, "team_user_idが存在しません。") if TeamUser.all.ids.exclude?(team_user_id)
    end
    def exist_team_id
      errors.add(:team_id, "team_idが存在しません。") if Team.all.ids.exclude?(team_id)
    end
    def exist_user_id
      errors.add(:user_id, "tuser_idが存在しません。") if User.all.ids.exclude?(user_id)
    end
end
