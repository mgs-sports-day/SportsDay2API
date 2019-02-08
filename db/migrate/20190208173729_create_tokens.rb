class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :token
      t.string :name

      t.timestamps
    end
  end
end
