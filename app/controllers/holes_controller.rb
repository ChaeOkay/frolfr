class HolesController < ApplicationController
  before_action :find_round_hole, :check_player

  def show
  end

  def update
    @round_hole.update(round_hole_params)

    if @hole.final?
      render json: { url: round_url(@round) }
    else
      render json: { url: round_hole_url(@round, id: @hole.next.number) }
    end
  end

  private

  def find_round_hole
    @round = Round.find(params[:round_id]).decorate
    @hole = @round.course.holes.find_by(number: params[:id])
    @round_hole = RoundHole.new(round: @round, hole: @hole)
  end

  def round_hole_params
    params.permit(:par).merge(results: params[:results])
  end

  def check_player
    redirect_to root_path unless playing_round?
  end

  def playing_round?
    current_user.rounds.include?(@round)
  end
end
