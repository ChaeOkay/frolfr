class Api::RoundsController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.scorecards_by_date
  end
end
