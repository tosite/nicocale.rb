# frozen_string_literal: true

# 困ったらこの辺読んで @未来の自分
#
# https://github.com/aki017/slack-api-docs
# https://www.rubydoc.info/gems/slack-api/
# https://api.slack.com/apps
# https://api.slack.com/docs/sign-in-with-slack
# https://api.slack.com/methods


class SlackController < ApplicationController
  def index
  end

  def new
    path = "https://slack.com/oauth/authorize\?scope\=identity.basic+identity.avatar\&client_id\=#{ENV['SLACK_CLIENT_ID']}"
    redirect_to path
  end

  def auth
    auth_params = {
      client_id:     ENV["SLACK_CLIENT_ID"],
      client_secret: ENV["SLACK_CLIENT_SECRET"],
      code:          params[:code],
      scope:         "identity.basic+identity.avatar",
    }
    result  = Slack.oauth_access(auth_params)
    token   = result["access_token"]
    client  = Slack::Client.new token: token
    @s_user = client.users_profile_get["profile"]
  end
end
