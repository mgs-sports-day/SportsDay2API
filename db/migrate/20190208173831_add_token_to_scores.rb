class AddTokenToScores < ActiveRecord::Migration[5.2]
  def change
    add_reference :scores, :token, foreign_key: true
  end
end
