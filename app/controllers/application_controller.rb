# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_common_team
  before_action :set_emotions

  def set_common_team
    return true unless user_signed_in?
    @new_team         = Team.new
    team_ids          = current_user.team_users.all.pluck(:team_id).uniq
    @joined_teams     = Team.where(id: team_ids)
    @not_joined_teams = Team.where.not(id: team_ids)
  end

  def set_emotions
    @emotions = Emotion.all
  end

  def redirect_back_page(notice: "", alerts: [], route: root_path)
    if notice.length > 0
      return redirect_back(fallback_location: route, notice: notice)
    end
    if alerts.count > 0
      return redirect_back(fallback_location: route, alert: alerts.full_messages)
    end
  end
end
