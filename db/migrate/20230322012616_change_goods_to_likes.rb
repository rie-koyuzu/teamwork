class ChangeGoodsToLikes < ActiveRecord::Migration[6.1]
  def change
    rename_table :goods, :likes
  end
end
