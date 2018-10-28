# frozen_string_literal: true

class GroupUser < ApplicationRecord
  has_one :group
  has_one :user
  validate :exist_group_id
  validate :exist_user_id

  private
    def exist_group_id
      errors.add(:group_id, "group_idが存在しません。") if Group.all.ids.exclude?(group_id)
    end
    def exist_user_id
      errors.add(:user_id, "user_idが存在しません。") if User.all.ids.exclude?(user_id)
    end
end
