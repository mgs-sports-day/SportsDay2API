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
    render json: @score, methods: :rank
  end

  def create
    @token = Token.find_by_token(request.headers['Token'])

    if @token
      @score = Score.find_by_id(params[:id])

      if @score
        @score.update!(create_params.merge(token: @token))
      else
        @score = Score.create!(create_params.merge(token: @token))
      end

      render json: @score, include: %i[form event]
    else
      render status: 403
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_score
    @score = Score.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def create_params
    params
      .require(:score)
      .permit(:event_id, :form_id, :competitor, :id)
      .merge(score: params[:points])
  end
end
