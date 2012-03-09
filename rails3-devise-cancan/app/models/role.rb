class Role < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name
  
  attr_accessible :name, :description, :role_type
  
  has_and_belongs_to_many :users, :join_table => 'users_roles'
end
