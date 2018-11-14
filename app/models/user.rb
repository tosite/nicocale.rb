# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise    :database_authenticatable,   :registerable,
            :recoverable, :rememberable, :validatable,
            :confirmable, :trackable
  has_many  :team_users,    dependent: :destroy
  has_many  :user_emotions, dependent: :destroy

  validates :account_id,
              presence:   true,
              length:     { maximum: 15 }, # Twitter
              uniqueness: true

  validates :name,
              presence: true,
              length:   { maximum: 50 } # Twitter

  def team_user(team_id)
    self.team_users.find_by(team_id: team_id)
  end
end
