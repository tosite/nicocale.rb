# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_new_team

  def set_new_team
    @new_team = Team.new
  end
end
