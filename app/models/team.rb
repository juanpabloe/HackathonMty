class Team < ActiveRecord::Base

  attr_accessible :name, :project_description, :project_name, :member1_name, :member1_email,
                  :member2_name, :member2_email, :member3_name, :member3_email, :member4_name, :member4_email

  validates :name, :presence => true
  validates :project_description, :presence => true
  validates :project_name, :presence => true
end
