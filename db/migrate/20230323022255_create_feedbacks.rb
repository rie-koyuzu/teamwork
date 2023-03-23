class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :admin_id, null: false
      t.integer :training_genre_id, null: false
      t.integer :training_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
