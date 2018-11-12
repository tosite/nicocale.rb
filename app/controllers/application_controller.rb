# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_new_team
  before_action :set_emotions

  def set_new_team
    @new_team = Team.new
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
