# frozen_string_literal: true

class AllocationsController < ApplicationController
  def show
    @allocation = Allocation.find_by(event_id: params[:event_id],
                                     year_group: params[:year_group],
                                     competitor: params[:competitor])

    render json: @allocation
  end
end
