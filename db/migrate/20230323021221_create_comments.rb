class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :member_id, null: false
      t.integer :training_genre_id, null: false
      t.integer :training_id,  null: false
      t.integer :progress, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
