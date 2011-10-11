class Team < ActiveRecord::Base

  has_many :members

  attr_accessible :name, :project_description, :project_name, :members_attributes

  validates :name, :presence => true
  validates :project_description, :presence => true
  validates :project_name, :presence => true

  accepts_nested_attributes_for :members

end
