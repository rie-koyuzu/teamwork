class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|

      t.integer :member_id, null: false
      t.integer :log_genre_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :importance, null: false,  default: 0

      t.timestamps
    end
  end
end
