class AddRoleTypeToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :role_type, :integer, :default => 3 # means User

  end
end
