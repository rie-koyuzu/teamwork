class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|

      t.integer :member_id, null:false
      t.integer :training_genre_id, null:false
      t.text :feedback, null:false
      t.integer :progress, null:false, default: 0

      t.timestamps
    end
  end
end
