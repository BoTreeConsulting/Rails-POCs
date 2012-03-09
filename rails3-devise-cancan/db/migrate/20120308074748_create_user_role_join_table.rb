class CreateUserRoleJoinTable < ActiveRecord::Migration
  def up
    create_table :users_roles, :id => false do |t|
      t.integer :user_id
      t.integer :role_id
    end
  end

  def down
    drop_table :users_roles
  end
end
