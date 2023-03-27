class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|

      t.integer :member_id
      t.integer :training_genre_id, null:false
      t.integer :progress, null:false, default: 0
      t.string :title, null:false
      t.integer :time, null:false
      t.text :introductio, null: false

      t.timestamps
    end
  end
end
