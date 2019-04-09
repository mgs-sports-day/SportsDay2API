# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  # GET /events
  def index
    @events = Event.all.order("id asc")

    render json: @events, include: [ records: { include: :form } ]
  end

  # GET /events/1
  def show
    render json: @event, include: [ { records: { include: :form } }, { scores: { include: :form, methods: :rank } }]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:name, :competitors)
  end
end
