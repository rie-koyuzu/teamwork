class CreateTrainingGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :training_genres do |t|

      t.string :menu, null:false

      t.timestamps
    end
  end
end
