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

  def callback
    # TODO:DB保存処理
    # TODO:リダイレクト先変更
    redirect_to "/auth/slack/index"
  end
end
