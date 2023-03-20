class AddAffiliationToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :affiliation, :string, null:false
  end
end
