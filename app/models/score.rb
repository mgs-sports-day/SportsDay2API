class Score < ApplicationRecord
  belongs_to :event
  belongs_to :form
  belongs_to :token
  
  def rank
    @rank = Score
            .joins(:form)
            .joins(:event)
            .where('forms.year = ?', self.form.year)
            .where('events.id = ?', self.event.id)
            .where('competitor = ?', self.competitor)
            .group('scores.id')
            .order('sum(scores.score) DESC')
            .map(&:id)
            .index(id)

    if @rank
      @rank + 1
    else
      Score.joins(:form).where('form.year = ?', self.form.year).where('events.id = ?', self.event.id).count
    end
  end
end
