class ChangeColumnOfMembers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :members, :last_name, false
    change_column_null :members, :first_name, false
    change_column_null :members, :last_name_eng, false
    change_column_null :members, :first_name_eng, false
    change_column_null :members, :employee_number, false
  end
end
