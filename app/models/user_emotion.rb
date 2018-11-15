# frozen_string_literal: true

class UserEmotion < ApplicationRecord
  belongs_to :team_user
  belongs_to :user
  belongs_to :team
  belongs_to :emotion

  validate   :exist_team_user_id
  validate   :exist_team_id
  validate   :exist_user_id
  validates  :reported_on, presence: true
  validates  :description, length: { maximum: 200 }

  scope :on_between, -> (month)   { where(reported_on: month..month.end_of_month) }
  scope :on,         -> (day)     { where(reported_on: day) }
  scope :team_id,    -> (team_id) { where(team_id: team_id) }
  scope :user_id,    -> (user_id) { where(user_id: user_id) }

  def self.e
    eager_load(:emotion)
  end

  def self.u
    eager_load(:user)
  end

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
