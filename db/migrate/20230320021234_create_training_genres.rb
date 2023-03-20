class CreateTrainingGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :training_genres do |t|

      t.integer :member_id, null:false

      t.timestamps
    end
  end
end
