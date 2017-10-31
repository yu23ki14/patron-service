class ChangeUserAuthority < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :authority, :string, null: false, default: "normal"
  end
end
