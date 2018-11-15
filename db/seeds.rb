# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Rake::Task["db:fixtures:load"].execute

accounts = [
  { id: "tanaka", name: "たなかくん", description: "はじめまして。" },
  { id: "ogawa", name: "おがっち", description: "" },
  { id: "nogami", name: "のがみん", description: "よろしく！" },
  { id: "yamada", name: "Y@M@D@", description: "" },
]

teams = [
  { name: "ひまわり組", description: "ひまわり組です。" },
  { name: "チームA", description: "" },
  { name: "ラーメン大好きクラブ", description: "ラーメン好き集まれ" },
]

emotions = [
  { name: "Good", score: 5 },
  { name: "Normal", score: 3 },
  { name: "Bad", score: 1 },
]


accounts.each { |u|
  user = User.new(email: "#{u[:id]}@example.com", password: "password", account_id: u[:id], name: u[:name], description: u[:description])
  user.skip_confirmation!
  user.save
}
tanaka = User.find_by(account_id: "tanaka")
ogawa  = User.find_by(account_id: "ogawa")
nogami = User.find_by(account_id: "nogami")
yamada = User.find_by(account_id: "yamada")
puts "accounts end."

teams.each { |t| Team.create(name: t[:name], description: t[:description]) }
team1 = Team.find_by(name: "ひまわり組")
team2 = Team.find_by(name: "チームA")
team3 = Team.find_by(name: "ラーメン大好きクラブ")
puts "teams end."

emotions.each { |t| Emotion.create(name: t[:name], score: t[:score]) }
good   = Emotion.find_by(name: "Good")
normal = Emotion.find_by(name: "Normal")
bad    = Emotion.find_by(name: "Bad")
puts "emotions end."

ogawa.team_users.create(team_id: team1.id)
nogami.team_users.create(team_id: team1.id)
yamada.team_users.create(team_id: team1.id)

nogami.team_users.create(team_id: team2.id)
yamada.team_users.create(team_id: team2.id)

yamada.team_users.create(team_id: team3.id)
puts "team users end."

month = Date.current
i = 0
(month.beginning_of_month..month.end_of_month).each { |d|
  u = ogawa.team_users.find_by(team_id: team1.id)
  user_emotions = {
    team_user_id: u.id,
    user_id: u.user_id,
    team_id: u.team_id,
    emotion_id: ((i + u.id) % 3) + 1,
    reported_on: d,
  }
  UserEmotion.create(user_emotions)

  u = nogami.team_users.find_by(team_id: team1.id)
  user_emotions = {
    team_user_id: u.id,
    user_id: u.user_id,
    team_id: u.team_id,
    emotion_id: (i % 3) + 1,
    reported_on: d,
  }
  UserEmotion.create(user_emotions)

  u = yamada.team_users.find_by(team_id: team1.id)
  user_emotions = {
    team_user_id: u.id,
    user_id: u.user_id,
    team_id: u.team_id,
    emotion_id: (i % 3) + 1,
    reported_on: d,
  }
  UserEmotion.create(user_emotions)

  i += 1
}
puts "user emotions end."
