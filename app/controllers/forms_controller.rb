# frozen_string_literal: true

class FormsController < ApplicationController
  before_action :set_form, only: %i[show]

  # GET /forms
  def index
    @forms = Form.all

    render json: @forms, include: :scores, methods: :total_points
  end

  # GET /forms/1
  def show
    render json: @form, include: { scores: { include: :event } }, methods: [:rank, :year_rank, :total_points]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_form
    @form = Form.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def form_params
    params.require(:form).permit(:name, :year)
  end
end
