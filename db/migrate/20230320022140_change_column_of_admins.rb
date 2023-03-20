class ChangeColumnOfAdmins < ActiveRecord::Migration[6.1]
  def change
    change_column_null :admins, :employee_number, false
  end
end
