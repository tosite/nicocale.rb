# frozen_string_literal: true

class Group < ApplicationRecord
  has_one_attached :avatar
  validates :name,
    presence: true,
    length: { maximum: 20 }
  has_many :group_user, dependent: :destroy
end
