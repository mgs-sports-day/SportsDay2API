# frozen_string_literal: true

class ScoresController < ApplicationController
  before_action :set_score, only: [:show]

  # GET /scores
  def index
    @scores = Score.all

    render json: @scores
  end

  # GET /scores/1
  def show
    render json: @score
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_score
    @score = Score.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def score_params
    params.require(:score).permit(:event_id, :form_id, :score, :competitor)
  end
end
