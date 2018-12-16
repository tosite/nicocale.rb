# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise    :database_authenticatable,   :registerable,
            :recoverable, :rememberable, :validatable,
            :confirmable, :trackable,    :omniauthable
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

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
