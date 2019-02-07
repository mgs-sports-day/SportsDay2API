# frozen_string_literal: true

class Form < ApplicationRecord
  has_many :scores

  def rank
    @rank = Form
            .joins(:scores)
            .group('forms.id')
            .order('sum(scores.score) DESC')
            .map(&:id)
            .index(id)

    if @rank
      @rank + 1
    else
      Form.all.count
    end
  end

  def year_rank
    @rank = Form
            .joins(:scores)
            .where('forms.year = ?', year)
            .group('forms.id')
            .order('sum(scores.score) DESC')
            .map(&:id)
            .index(id)

    if @rank
      @rank + 1
    else
      Form.where('forms.year = ?', year).count
    end
  end

  def total_points
    self.scores.sum('scores.score')
  end
end
