class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|

      t.integer :member_id
      t.integer :log_id

      t.timestamps
    end
  end
end
