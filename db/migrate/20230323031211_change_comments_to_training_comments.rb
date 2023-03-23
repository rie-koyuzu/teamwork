class ChangeCommentsToTrainingComments < ActiveRecord::Migration[6.1]
  def change
    rename_table :comments, :training_comments
  end
end
