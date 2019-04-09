# frozen_string_literal: true

class RecordsController < ApplicationController
  def scoped_records
    @record = Record.find_by(past_year_group: params[:year_group], event_id: params[:event_id], current_record: false)
    render json: @record, include: :form
  end

  def current_record
    @record = Record.joins(:form)
                    .where('forms.year = ?', params[:year_group])
                    .find_by(event_id: params[:event_id], current_record: true)

    render json: @record, include: :form
  end

  def update_record
    previous_record = Record.joins(:form).where('forms.year = ?', params[:year_group])
                            .find_by(event_id: params[:event_id], current_record: true)
    old_record = previous_record

    previous_record&.destroy

    if !params['destroy_record']
      @record = Record.new(event_id: params[:event_id],
                           current_record: true,
                           score: params['record_value'],
                           holder: params['record_holder'],
                           year: 2019,
                           competitor: params['record_competitor'],
                           form_id: params['form_id']) do |record|
        if params[:event_id].to_i.between?(1, 4)
          record.units = 'metre'
        elsif params[:event_id].to_i.between?(5, 11)
          record.units = 'second'
        end
      end

      @record.save

      render json: @record, include: [:form]
    else
      render json: old_record
    end
  end
end
