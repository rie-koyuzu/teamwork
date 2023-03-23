class RenameBodyColumnToTrainingComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :training_comments, :body, :comment
  end
end
